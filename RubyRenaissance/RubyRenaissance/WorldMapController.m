//
//  WorldMapController.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 2/5/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "WorldMapController.h"
#import "BuyAndSellController.h"
#import "GameManager.h"

@interface WorldMapController ()

@end

@implementation WorldMapController

NSString* destinationCity;

GameManager* myGameManager;

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
    
    destinationCity = @"";
    
    myGameManager = [GameManager sharedGameManager];
}

- (IBAction)mapButtonPressed:(id)sender{
    
    UIButton* myButton = sender;
    
    if(myButton.tag == 1){
        destinationCity = @"Milan";
    }
    if(myButton.tag == 2){
        destinationCity = @"Venice";
    }
    if(myButton.tag == 3){
        destinationCity = @"Lucca";
    }
    if(myButton.tag == 4){
        destinationCity = @"Florence";
    }
    if(myButton.tag == 5){
        destinationCity = @"Rome";
    }
    if(myButton.tag == 6){
        destinationCity = @"Naples";
    }
    
    
    // prepare segue
    // set origin point
    
    CGPoint cityTappedOrigin = myButton.center;
    [myGameManager setCityOriginForSegue:cityTappedOrigin];
    
    //NSLog(@"World map button X value is");
    //NSLog([NSString stringWithFormat:@"%f", cityTappedOrigin.x]);
    
    
    [self performSegueWithIdentifier:@"segueFromMapToBuySell" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueFromMapToBuySell"]) {
        
        BuyAndSellController *destinationController = segue.destinationViewController;
        [destinationController initializeCurrentCityTo:destinationCity];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
