//
//  StatusViewController.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/30/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "StatusViewController.h"
#import "Player.h"

@interface StatusViewController ()

@end

@implementation StatusViewController

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
    
    //set labels
    _totalCurrencyLabel.text = [NSString stringWithFormat:@"%d", [_myPlayer currency]];
    
    _malachiteCountLabel.text = [NSString stringWithFormat:@"%d", [_myPlayer malachiteCount]];
    _pearlCountLabel.text = [NSString stringWithFormat:@"%d", [_myPlayer pearlCount]];
    _emeraldCountLabel.text = [NSString stringWithFormat:@"%d", [_myPlayer emeraldCount]];
    _sapphireCountLabel.text = [NSString stringWithFormat:@"%d", [_myPlayer sapphireCount]];
    _diamondCountLabel.text = [NSString stringWithFormat:@"%d", [_myPlayer diamondCount]];
    _rubyCountLabel.text = [NSString stringWithFormat:@"%d", [_myPlayer rubyCount]];
    
}

- (IBAction)backButtonTouched:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
