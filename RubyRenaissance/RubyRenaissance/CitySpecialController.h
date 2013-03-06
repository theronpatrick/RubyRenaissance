//
//  CitySpecialController.h
//  RubyRenaissance
//
//  Created by Theron Patrick on 2/15/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CitySpecialController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *agreeButton;

@property (strong, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *newsTextView;
@property (strong, nonatomic) IBOutlet UITextView *specialTextView;

@property (nonatomic) int currentCity;

- (IBAction)backButtonTouched:(id)sender;
- (IBAction)agreeButtonTouched:(id)sender;

@end
