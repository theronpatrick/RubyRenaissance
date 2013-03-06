//
//  CitySpecialController.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 2/15/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "CitySpecialController.h"
#import "GameManager.h"
#import "NewsEventManager.h"

@interface CitySpecialController ()

@end

@implementation CitySpecialController

@synthesize cityNameLabel = _cityNameLabel;
@synthesize newsTextView = _newsTextView;
@synthesize specialTextView = _specialTextView;


GameManager* _myGameManager;
NewsEventManager* _myNewsEventManager;

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
    _myGameManager = [GameManager sharedGameManager];
    _myNewsEventManager = [NewsEventManager sharedNewsEventManager];
    
    _cityNameLabel.text = [self getCityName];
    
    [self setCitySpecialText];
    
    _newsTextView.text = [_myNewsEventManager getNewsEventText];
    _newsTextView.font = [UIFont fontWithName:@"BlackChancery" size:20.0];
    _specialTextView.font = [UIFont fontWithName:@"BlackChancery" size:17.0];
    
    
    
    NSLog(@"Special city loaded");
    
    
}

- (NSString*) getCityName{
    
    switch (_currentCity){
            
        case NoCityTag:
            return @"No City";
            break;
            
        case MilanTag:
            return @"Milan";
            break;
            
        case VeniceTag:
            return @"Venice";
            break;
        
        case LuccaTag:
            return @"Lucca";
            break;
            
        case FlorenceTag:
            return @"Florence";
            break;
            
        case RomeTag:
            return @"Rome";
            break;
            
        case NaplesTag:
            return @"Naples";
            break;
            
        default:
            return @"? City";
            break;
            
            
            
    }
}

- (void) setCitySpecialText{
    
    
    
    
    // set right text for city
    switch (_currentCity){
            
        case NoCityTag:
            [_myGameManager determineDefaultProject];
            break;
            
        case MilanTag:
            [_myGameManager determineDefaultProject];
            break;
            
        case VeniceTag:
            [_myGameManager determineDefaultProject];
            break;
            
        case LuccaTag:
          [_myGameManager determineDefaultProject];
            break;
            
        case FlorenceTag:
            [_myGameManager determineDefaultProject];
            break;
            
        case RomeTag:
            [_myGameManager determineProjectForRome];
            break;
            
        case NaplesTag:
            [_myGameManager determineDefaultProject];
            break;
            
        default:
            [_myGameManager determineDefaultProject];
            break;
            
            
            
    }

    
    _specialTextView.text = [_myGameManager getCitySpecialText];
    
}

- (IBAction)backButtonTouched:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)agreeButtonTouched:(id)sender{
    
    [_myGameManager financeRomeProject];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
