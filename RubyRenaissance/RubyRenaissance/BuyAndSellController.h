//
//  BuyAndSellController.h
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/21/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyAndSellController : UIViewController
@property (strong, nonatomic) IBOutlet UIStepper *rubyStepper;

@property (strong, nonatomic) IBOutlet UILabel *rubyLabel;

- (IBAction)stepperValueChanged:(UIStepper *)sender;

@end
