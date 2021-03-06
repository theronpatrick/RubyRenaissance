//
//  MainMenuController.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/30/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "MainMenuController.h"
#import "Player.h"
#import "GameManager.h"

@interface MainMenuController ()

@end

@implementation MainMenuController

@synthesize startNewGameButton = _newGameButton;

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
    
    // Set custom font
    [[UILabel appearance] setFont:[UIFont fontWithName:@"BlackChancery" size:20.0]];
    //[[UITextField appearance] setFont:[UIFont fontWithName:@"BlackChancery" size:20.0]];
}

- (IBAction)startNewGame:(id)sender{
    
    //reset old stuff
    
    [Player resetPlayer];
    [GameManager resetGame];
    
    
    //get new stuff
    Player* myPlayer = [Player sharedPlayer];
    GameManager* myGameManager = [GameManager sharedGameManager];
    
    
    
    //DEMO set up player currency and gems and days remaining
    [myPlayer setCurrency:1500];
    [myPlayer setGemCapacity:100];
    [myGameManager setDaysRemaining:10];
    [myGameManager setLastCity: RomeTag];
    
    //NSLog(@"startNewGameButton hit");
    
    //NSLog([NSString stringWithFormat:@"%d", myPlayer.currency]);
    
    [self performSegueWithIdentifier:@"testNewGameSegue" sender:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
