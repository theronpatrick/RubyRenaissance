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

//Labels
@property (strong, nonatomic) IBOutlet UILabel *numberInputLabel;
@property (strong, nonatomic) IBOutlet UILabel *rubyLabel;
@property (strong, nonatomic) IBOutlet UIView *numberInputView;
@property (strong, nonatomic) IBOutlet UILabel *currencyLabel;
@property (strong, nonatomic) IBOutlet UILabel *pricePerItemLabel;
@property (strong, nonatomic) IBOutlet UILabel *buyTotalLabel;
@property (strong, nonatomic) IBOutlet UILabel *sellTotalLabel;

//Buttons
@property (strong, nonatomic) IBOutlet UIButton *buyNumberButton;
@property (strong, nonatomic) IBOutlet UIButton *sellNumberButton;
@property (strong, nonatomic) IBOutlet UIButton *buyButton;
@property (strong, nonatomic) IBOutlet UIButton *sellButton;


//Gem Buttons
@property (strong, nonatomic) IBOutlet UIButton *malachiteButton;



@property (nonatomic) int buyNumber;
@property (nonatomic) int sellNumber;

@property (strong, nonatomic) NSString* activeGem;





- (IBAction)stepperValueChanged:(UIStepper *)sender; // <- not needed
- (IBAction)numberButtonTapped:(id) sender;
- (IBAction)inputNumberButtonTapped:(id) sender;
- (IBAction)utilityButtonTapped:(id) sender; // <-- could be split up into different methods
- (IBAction)buyButtonTapped:(id) sender;
- (IBAction)sellButtonTapped:(id) sender;


- (IBAction)gemTouched:(id) sender;

@end
