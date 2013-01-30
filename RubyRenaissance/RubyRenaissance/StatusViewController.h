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
@property (strong, nonatomic) IBOutlet UILabel *malachiteCountLabel;

-(IBAction) backButtonTouched:(id)sender;


@end
