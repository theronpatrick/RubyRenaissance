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
@synthesize rubyStepper = _rubyStepper;

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

- (IBAction)stepperValueChanged:(UIStepper *)sender{
    
    _rubyLabel.text = [NSString stringWithFormat:@"%f", _rubyStepper.value];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
