//
//  GameOverController.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 2/14/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "GameOverController.h"
#import "GameManager.h"
#import "Player.h"

@interface GameOverController ()

@end

@implementation GameOverController

@synthesize totalCurrencyLabel = _totalCurrencyLabel;

Player* _myPlayer;

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
    
    _totalCurrencyLabel.text = [NSString stringWithFormat:@"%d", [_myPlayer currency]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
