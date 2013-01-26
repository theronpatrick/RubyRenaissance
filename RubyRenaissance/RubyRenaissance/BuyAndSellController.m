//
//  BuyAndSellController.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/21/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "BuyAndSellController.h"

@interface BuyAndSellController ()

@end

@implementation BuyAndSellController

@synthesize rubyLabel = _rubyLabel;
@synthesize numberInputLabel = _numberInputLabel;
@synthesize rubyStepper = _rubyStepper;

@synthesize numberInputView = _numberInputView;

@synthesize buyNumber = _buyNumber;
@synthesize sellNumber = _sellNumber;

@synthesize buyNumberButton = _buyNumberButton;
@synthesize sellNumberButton = _sellNumberButton;

bool firstTimeButtonPressed;
bool isBuyNumber;

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
    
    firstTimeButtonPressed = true;
    isBuyNumber = true;
    
    _buyNumber = 0;
    _sellNumber = 0;
}

- (IBAction)stepperValueChanged:(UIStepper *)sender{
    
    _rubyLabel.text = [NSString stringWithFormat:@"%f", _rubyStepper.value];
    
}

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
    
}

- (void)updateLabelsFromSellNumber{
    
    _numberInputLabel.text = [NSString stringWithFormat:@"%d", _sellNumber];
    [_sellNumberButton setTitle:[NSString stringWithFormat:@"%d", _sellNumber] forState:UIControlStateNormal];
    
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
    }
}

-(IBAction)gemTouched:(id)sender{
    
    NSLog(@"Malachite touched");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
