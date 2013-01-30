//
//  MainMenuController.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/30/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "MainMenuController.h"
#import "Player.h"

@interface MainMenuController ()

@end

@implementation MainMenuController

@synthesize startNewGameButton = _newGameButton;

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
}

- (IBAction)startNewGame:(id)sender{
    
    Player* myPlayer = [Player sharedPlayer];
    
    //DEMO set up player currency and gems
    [myPlayer setCurrency:1000];
    
    NSLog(@"startNewGameButton hit");
    
    NSLog([NSString stringWithFormat:@"%d", myPlayer.currency]);
    
    [self performSegueWithIdentifier:@"testNewGameSegue" sender:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
