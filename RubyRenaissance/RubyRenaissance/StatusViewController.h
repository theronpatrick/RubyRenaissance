//
//  StatusViewController.h
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/30/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StatusViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *totalCurrencyLabel;
@property (strong, nonatomic) IBOutlet UILabel *gemCapacityLabel;
@property (strong, nonatomic) IBOutlet UILabel *malachiteCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *pearlCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *emeraldCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *sapphireCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *diamondCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *rubyCountLabel;

-(IBAction) backButtonTouched:(id)sender;


@end
