//
//  BuyAndSellController.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/21/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "BuyAndSellController.h"
#import "Player.h"
#import "GameManager.h"
#import "CitySpecialController.h"
#import "NewsEventManager.h"

@interface BuyAndSellController ()

@end

@implementation BuyAndSellController

@synthesize rubyLabel = _rubyLabel;
@synthesize numberInputLabel = _numberInputLabel;

@synthesize numberInputView = _numberInputView;

@synthesize buyNumber = _buyNumber;
@synthesize sellNumber = _sellNumber;

@synthesize buyNumberButton = _buyNumberButton;
@synthesize sellNumberButton = _sellNumberButton;

@synthesize activeGem = _activeGem;

@synthesize currentCity = _currentCity;

@synthesize purchasedPriceLabel = _purchasedPriceLabel;
@synthesize daysRemainingLabel = _daysRemainingLabel;

@synthesize cityLabel = _cityLabel;

bool firstTimeButtonPressed;
bool isBuyNumber;

int _unitCost;

int _maxBuyNumber;
int _maxSellNumber;

NSString* currentCityString;

//shared resources

Player* _myPlayer;
GameManager* _myGameManager;
NewsEventManager* _myNewsEventManager;

// enums for gems
typedef enum {
    NoGemTag = 10,
    MalachiteTag = 11,
    PearlTag = 12,
    EmeraldTag = 13,
    SapphireTag = 14,
    DiamondTag = 15,
    RubyTag = 16
} GemTag;

// enums for cities
typedef enum {
    NoCityTag = 20,
    MilanTag = 21,
    VeniceTag = 22,
    LuccaTag = 23,
    FlorenceTag = 24,
    RomeTag = 25,
    NaplesTag = 26
} CityTag;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _myPlayer = [Player sharedPlayer];
    _myGameManager = [GameManager sharedGameManager];
    
    firstTimeButtonPressed = true;
    isBuyNumber = true;
    
    _buyNumber = 0;
    _sellNumber = 0;
    _maxBuyNumber = 0;
    _maxSellNumber = 0;
    
    _unitCost = 0;
    
    //Player* myPlayer = [Player sharedPlayer];
    //NSLog(@"currency label should say");
    //NSLog([NSString stringWithFormat:@"%d", [_myPlayer currency]]);
    _currencyLabel.text = [NSString stringWithFormat:@"%d", [_myPlayer currency]];
    
    _activeGem = NoGemTag;
    
  
   
    
    //still some confusion about when things load, but this should solve city bit
    if(_currentCity == 0){
        [self initializeCurrentCityTo:@"Rome"];
        NSLog(@"Current city tag is Rome to begin");
    }
    
      _cityLabel.text = currentCityString;
    
    //for testing, simply randomize prices
    // only occur if city changed
    if(_currentCity != [_myGameManager getLastCity]){
        
        [self cityDidChange];
    }
    
    _daysRemainingLabel.text = [NSString stringWithFormat:@"%d", [_myGameManager getDaysRemaining]];
    
    //default to malachite being touched
    
    [self gemTouched:_malachiteButton];
    
}

- (void) cityDidChange{
    
    [_myGameManager randomizePrices];
    [_myGameManager calculateInflation];
    
    [_myGameManager setLastCity:_currentCity];
    
    int daysRemaining = [_myGameManager getDaysRemaining];
    [_myGameManager setDaysRemaining: daysRemaining - 1];
    
    [_myNewsEventManager determineRandomNewsEvent];
    [_myNewsEventManager performNewsEvent];
    
    NSLog(@"Changed city block");
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    //Player* myPlayer = [Player sharedPlayer];
   
    
    //NSLog([NSString stringWithFormat:@"%d", [_myPlayer currency]]);
    
    //NSLog(@"Current city is:");
    //NSLog([NSString stringWithFormat:@"%d", _currentCity]);
    
    _currencyLabel.text = [NSString stringWithFormat:@"%d", [_myPlayer currency]];
    
    
}



#pragma mark Button Methods
- (IBAction)numberButtonTapped:(id)sender{
    
    //Detect if buy or sell number is being edited
    UIButton* myButton = sender;
    int buttonTag = myButton.tag;

    bool shouldAnimate = true;
    
    //this could get tricky, make sure it is consistant with right button tags being pressed
    if(buttonTag == 1){
        
        //check to see if window is already open and previous number was opposite type
        if(isBuyNumber == false && _numberInputView.alpha == 1.0){
            shouldAnimate = false;
            firstTimeButtonPressed = true;
        }
        
        isBuyNumber = true;
    }
    else{
        
        //check to see if window is already open and previous number was opposite type
        if(isBuyNumber == true && _numberInputView.alpha == 1.0){
            shouldAnimate = false;
            firstTimeButtonPressed = true;
        }
        
    isBuyNumber = false;
    }
    
    [self toggleNumberInputViewWithAnimate:shouldAnimate];
    
    
    
}

- (IBAction)inputNumberButtonTapped:(id)sender{
    
    //get button pressed
    UIButton* myButton = sender;
    NSString* numberPressed = myButton.titleLabel.text;
    int intPressed = [numberPressed intValue];
    
    //NSLog(numberPressed);
    
    //set temp int to either the buy or sell number
    int tempInt = 0;
    if(isBuyNumber){
        tempInt = _buyNumber;
    }
    else{
        tempInt = _sellNumber;
    }
    
    
    //Change number
    if(firstTimeButtonPressed){
        tempInt = intPressed;
        
        firstTimeButtonPressed = false;
        
    }
    else{
        //make sure this works
        tempInt = tempInt * 10 + intPressed;
    
    }

    //save numbers into global variable and update
    if(isBuyNumber){
        _buyNumber = tempInt;
        [self updateLabelsFromBuyNumber];
    }
    else{
        _sellNumber = tempInt;
        [self updateLabelsFromSellNumber];
    }






}

- (void)updateLabelsFromBuyNumber{
    
    _numberInputLabel.text = [NSString stringWithFormat:@"%d", _buyNumber];
    [_buyNumberButton setTitle:[NSString stringWithFormat:@"%d", _buyNumber] forState:UIControlStateNormal];
    
    //update total buy cost
    
    int totalCost = _buyNumber * _unitCost;
    
    _buyTotalLabel.text = [NSString stringWithFormat:@"%d", totalCost];
    
}

- (void)updateLabelsFromSellNumber{
    
    _numberInputLabel.text = [NSString stringWithFormat:@"%d", _sellNumber];
    [_sellNumberButton setTitle:[NSString stringWithFormat:@"%d", _sellNumber] forState:
     UIControlStateNormal];
    
    //update total sell cost
    
    int totalCost = _sellNumber * _unitCost;
    
    _sellTotalLabel.text = [NSString stringWithFormat:@"%d", totalCost];
    
}

- (void)toggleNumberInputViewWithAnimate: (bool) shouldAnimate{
    

    //change label to reflect proper number
    if(isBuyNumber){
        _numberInputLabel.text = [NSString stringWithFormat:@"%d", _buyNumber];
        [_buyNumberButton setTitle:[NSString stringWithFormat:@"%d", _buyNumber] forState:UIControlStateNormal];
    }
    else{
        _numberInputLabel.text = [NSString stringWithFormat:@"%d", _sellNumber];
        [_sellNumberButton setTitle:[NSString stringWithFormat:@"%d", _sellNumber] forState:UIControlStateNormal];
    }
     
    
    //open or close number input panel
    
    if(shouldAnimate == true){
    double duration = 0.2;
    
    if(_numberInputView.alpha == 0){
        
        [UIView animateWithDuration:duration animations:^() {
            _numberInputView.alpha = 1.0;
        }];
        
    }
    else{
        [UIView animateWithDuration:duration animations:^() {
            _numberInputView.alpha = 0.0;
        }];
    }
        
        //reset first input
        firstTimeButtonPressed = true;
        
    }
   
    
}

-(IBAction)utilityButtonTapped:(id)sender{
    //get button pressed
    UIButton* myButton = sender;
    NSString* buttonPressedString = myButton.titleLabel.text;
    
    // cases for utility buttons
    
    // + button
    if([buttonPressedString isEqualToString:@"+"]){
        
        if(isBuyNumber == true){
            _buyNumber = _buyNumber + 1;
            [self updateLabelsFromBuyNumber];
        }
        else{
            _sellNumber = _sellNumber + 1;
            [self updateLabelsFromSellNumber];
        }
        
    }
    
    // - button
    if([buttonPressedString isEqualToString:@"-"]){
        
        if(isBuyNumber == true && _buyNumber > 0){
            _buyNumber = _buyNumber - 1;
            [self updateLabelsFromBuyNumber];
        }
        else if( isBuyNumber == false && _sellNumber > 0){
            _sellNumber = _sellNumber - 1;
            [self updateLabelsFromSellNumber];
        }
        
    }
    
    // max button
    if([buttonPressedString isEqualToString:@"Max"]){
        
        [self setMaxPrices];
        
        //update based on buy if buy number if in buy mode
        if(isBuyNumber == true){
        [self updateLabelsFromBuyNumber];
        }
        
        //toggle next number to clear label
        firstTimeButtonPressed = true;
        
        
    }
    
    // clear button
    if([buttonPressedString isEqualToString:@"Clear"]){
        if(isBuyNumber == true){
            _buyNumber = 0;
            [self updateLabelsFromBuyNumber];
        }
        else{
            _sellNumber = 0;
            [self updateLabelsFromSellNumber];
        }
    }
    
    // done button
    if([buttonPressedString isEqualToString:@"Done"]){
        [self toggleNumberInputViewWithAnimate:true];
        
        if(isBuyNumber == true){
            //perform same functionality as buy button
            [self buyButtonTapped:sender];
        }
        else{
            [self sellButtonTapped:sender];
        }
    }
}


#pragma mark Gem Buttons
-(IBAction)gemTouched:(id)sender{
    
    //NSLog(@"gemTouched hit");
    
    //detect which gem was touched
    //note: gem tags start with "1" i.e. malachite is 11, pearl is 12, etc.
    //also note: might want to be in a switch statement
    UIButton* myButton = sender;
    int tagInt = myButton.tag;
    
    //NSLog(@"Tag is");
    //NSLog([NSString stringWithFormat:@"%d", tagInt]);
    
    //This is just for testing the price changes, take out before moving on
    
    //[_myGameManager calculatePriceForGem:RubyTag gemPrice:[_myGameManager getBaseRubyPrice] fixedVariation:-10.0 variableVariation:1.0];
    
    switch (tagInt) {
            
        case MalachiteTag:
            NSLog(@"Malachite touched");
            
            _activeGem = MalachiteTag;
            _unitCost = [_myGameManager getMalachitePrice];
            
            break;
            
        case PearlTag:
            NSLog(@"Pearl touched");
            
            _activeGem = PearlTag;
            _unitCost = [_myGameManager getPearlPrice];
            break;
            
        case EmeraldTag:
            NSLog(@"Emerald touched");
            
            _activeGem = EmeraldTag;
            _unitCost = [_myGameManager getEmeraldPrice];
            break;
            
        case SapphireTag:
            NSLog(@"Sapphire touched");
            
            _activeGem = SapphireTag;
            _unitCost = [_myGameManager getSapphirePrice];
            break;
            
        case DiamondTag:
            NSLog(@"Diamond touched");
            
            _activeGem = DiamondTag;
            _unitCost = [_myGameManager getDiamondPrice];
            break;
            
        case RubyTag:
            NSLog(@"Ruby touched");
            
            _activeGem = RubyTag;
            _unitCost = [_myGameManager getRubyPrice];
            
            NSLog(@"Price returned from ruby touched is");
            //NSLog([NSString stringWithFormat:@"%d", [_myGameManager getRubyPrice]]);
            break;
        
        default:
            NSLog(@"How'd this happen?");
            break;
    }


    
    
    _pricePerItemLabel.text = [NSString stringWithFormat:@"%d", _unitCost];
    _purchasedPriceLabel.text = [NSString stringWithFormat:@"%d", [_myGameManager getPurchasedPriceForGem:_activeGem]];
    
    
    
    [self setMaxPrices];
}

- (void)setMaxPrices{
    
    _buyNumber = [_myPlayer currency] / _unitCost;
    
    //check against inventory numbers
    
    int capacityLeft = [self gemCapacityAvailable];
    
    if( _buyNumber > capacityLeft){
        
        _buyNumber = capacityLeft;
    }
    
    [self updateLabelsFromBuyNumber];
    //set the max number a player can buy equal to this calculation.
    //TODO: Ensure that this is accurate in all cases
    _maxBuyNumber = _buyNumber;
    
    // sell numbers
    
    int totalGems = 0;
    
    switch (_activeGem) {
            
        case MalachiteTag:
            totalGems = [_myPlayer malachiteCount];
            break;
            
        case PearlTag:
            totalGems = [_myPlayer pearlCount];
            
            break;
            
        case EmeraldTag:
            totalGems = [_myPlayer emeraldCount];
            
            break;
            
        case SapphireTag:
            totalGems = [_myPlayer sapphireCount];
            
            break;
            
        case DiamondTag:
            totalGems = [_myPlayer diamondCount];
            
            break;
            
        case RubyTag:
            totalGems = [_myPlayer rubyCount];
            
            break;
            
            
        default:
            NSLog(@"Whoops");
            break;
    }
    
    _sellNumber = totalGems;
    
    [self updateLabelsFromSellNumber];
    
    _maxSellNumber = _sellNumber;
    
    
    
}


-(IBAction)buyButtonTapped:(id)sender{
    
    //check valid value
    if (_buyNumber > _maxBuyNumber ||
     _buyNumber < 0){
        NSLog(@"Invalid Buy Value");
        return;
    }
    
    
    
    //calculate new total currency
    int newCurrency = [_myPlayer currency] - (_unitCost * _buyNumber);
    _currencyLabel.text = [NSString stringWithFormat:@"%d", newCurrency];
    //set new currency
    [_myPlayer setCurrency:newCurrency];
    
    //update inventory
    
    int totalGems;
    
    switch (_activeGem) {
            
        case MalachiteTag:
            totalGems = [_myPlayer malachiteCount] + _buyNumber;
            [_myPlayer setMalachiteCount:totalGems];
            
            break;
        
        case PearlTag:
            totalGems = [_myPlayer pearlCount] + _buyNumber;
            [_myPlayer setPearlCount:totalGems];
            
            break;
            
        case EmeraldTag:
            totalGems = [_myPlayer emeraldCount] + _buyNumber;
            [_myPlayer setEmeraldCount:totalGems];
            
            break;
            
        case SapphireTag:
            totalGems = [_myPlayer sapphireCount] + _buyNumber;
            [_myPlayer setSapphireCount:totalGems];
            
            break;
            
        case DiamondTag:
            totalGems = [_myPlayer diamondCount] + _buyNumber;
            [_myPlayer setDiamondCount:totalGems];
            
            break;
            
        case RubyTag:
            totalGems = [_myPlayer rubyCount] + _buyNumber;
            [_myPlayer setRubyCount:totalGems];
            
            break;

            
        default:
            NSLog(@"Well that ain't right");
            return;
            
            break;
    }
    
    
//    int totalMalachites = [_myPlayer malachiteCount] + _buyNumber;
//    [_myPlayer setMalachiteCount:totalMalachites];
    
    
    //close number input pane if it's open
    if(_numberInputView.alpha > 0){
        [self toggleNumberInputViewWithAnimate:true];
    }
    
    //update labels
    [self setMaxPrices];
    
    //set purchased price
    [_myGameManager setPurchasedPriceForGem:_activeGem withPrice:_unitCost];
    
}

-(IBAction)sellButtonTapped:(id)sender{
    
    //check valid value
    if (_sellNumber > _maxSellNumber ||
        _sellNumber < 0){
        NSLog(@"Invalid Sell Value");
        return;
    }
    
    //calculate new total currency
    int newCurrency = [_myPlayer currency] + (_unitCost * _sellNumber);
    _currencyLabel.text = [NSString stringWithFormat:@"%d", newCurrency];
    //set new currency
    [_myPlayer setCurrency:newCurrency];
    
    //update inventory
    
    int totalGems;
    
    switch (_activeGem) {
            
        case MalachiteTag:
            totalGems = [_myPlayer malachiteCount] - _sellNumber;
            [_myPlayer setMalachiteCount:totalGems];
            
            break;
            
        case PearlTag:
            totalGems = [_myPlayer pearlCount] - _sellNumber;
            [_myPlayer setPearlCount:totalGems];
            
            break;
            
        case EmeraldTag:
            totalGems = [_myPlayer emeraldCount] - _sellNumber;
            [_myPlayer setEmeraldCount:totalGems];
            
            break;
            
        case SapphireTag:
            totalGems = [_myPlayer sapphireCount] - _sellNumber;
            [_myPlayer setSapphireCount:totalGems];
            
            break;
            
        case DiamondTag:
            totalGems = [_myPlayer diamondCount] - _sellNumber;
            [_myPlayer setDiamondCount:totalGems];
            
            break;
            
        case RubyTag:
            totalGems = [_myPlayer rubyCount] - _sellNumber;
            [_myPlayer setRubyCount:totalGems];
            
            break;
            
            
        default:
            NSLog(@"Well that ain't right");
            return;
            break;
    }
    
    
    //    int totalMalachites = [_myPlayer malachiteCount] + _buyNumber;
    //    [_myPlayer setMalachiteCount:totalMalachites];
    
    
    //close number input pane if it's open
    if(_numberInputView.alpha > 0){
        [self toggleNumberInputViewWithAnimate:true];
    }
    
    //update labels
    [self setMaxPrices];
    
}

- (IBAction) mapButtonTapped:(id)sender{
    
    if([_myGameManager getDaysRemaining] == 0){
        [self performSegueWithIdentifier:@"GameOverSegue" sender:self];
    }
    else{
        [self performSegueWithIdentifier:@"worldMapSegue" sender:self];
    }
    
    
}

- (void) initializeCurrentCityTo: (NSString*) cityName{
    
    currentCityString = cityName;
    
    
    
    //pass in city name, set current city (probably before segue from map)
    
    if([cityName isEqualToString:@"Milan"]){
        _currentCity = MilanTag;
    }
    
    if([cityName isEqualToString:@"Venice"]){
        _currentCity = VeniceTag;
    }
    
    if([cityName isEqualToString:@"Lucca"]){
        _currentCity = LuccaTag;
    }
    
    if([cityName isEqualToString:@"Florence"]){
        _currentCity = FlorenceTag;
    }
    
    if([cityName isEqualToString:@"Rome"]){
        _currentCity = RomeTag;
    }
    
    if([cityName isEqualToString:@"Naples"]){
        _currentCity = NaplesTag;
    }

    NSLog(@"IntializeCurrentCity block and city is:");
    NSLog(cityName);
    
    
    
}

- (int) gemCapacityAvailable{
    
    int capacity = [_myPlayer gemCapacity];
    
    int gemsHeld = [_myPlayer malachiteCount] +
                    [_myPlayer pearlCount] +
                    [_myPlayer emeraldCount] +
                    [_myPlayer sapphireCount] +
                    [_myPlayer diamondCount] +
                    [_myPlayer rubyCount];
    
    NSLog(@"Number of inventory spots left is:");
    NSLog([NSString stringWithFormat:@"%d", capacity - gemsHeld]);
    
    return capacity - gemsHeld;
    
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueToCitySpecial"]) {
        
        CitySpecialController *destinationController = segue.destinationViewController;
        [destinationController setCurrentCity:_currentCity];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
