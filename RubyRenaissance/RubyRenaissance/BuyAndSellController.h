//
//  BuyAndSellController.h
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/21/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyAndSellController : UIViewController


//Labels
@property (strong, nonatomic) IBOutlet UILabel *numberInputLabel;
@property (strong, nonatomic) IBOutlet UILabel *rubyLabel;
@property (strong, nonatomic) IBOutlet UIView *numberInputView;
@property (strong, nonatomic) IBOutlet UILabel *currencyLabel;
@property (strong, nonatomic) IBOutlet UILabel *pricePerItemLabel;
@property (strong, nonatomic) IBOutlet UILabel *buyTotalLabel;
@property (strong, nonatomic) IBOutlet UILabel *sellTotalLabel;
@property (strong, nonatomic) IBOutlet UILabel *purchasedPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *daysRemainingLabel;
@property (strong, nonatomic) IBOutlet UILabel *cityLabel;

//Buttons
@property (strong, nonatomic) IBOutlet UIButton *buyNumberButton;
@property (strong, nonatomic) IBOutlet UIButton *sellNumberButton;
@property (strong, nonatomic) IBOutlet UIButton *buyButton;
@property (strong, nonatomic) IBOutlet UIButton *sellButton;


//Gem Buttons
@property (strong, nonatomic) IBOutlet UIButton *malachiteButton;
@property (strong, nonatomic) IBOutlet UIButton *pearlButton;
@property (strong, nonatomic) IBOutlet UIButton *emeraldButton;
@property (strong, nonatomic) IBOutlet UIButton *sapphireButton;
@property (strong, nonatomic) IBOutlet UIButton *diamondButton;
@property (strong, nonatomic) IBOutlet UIButton *rubyButton;

//Current City
@property (nonatomic) int currentCity;



@property (nonatomic) int buyNumber;
@property (nonatomic) int sellNumber;

@property (nonatomic) int activeGem;





//- (IBAction)stepperValueChanged:(UIStepper *)sender; // <- not needed
- (IBAction)numberButtonTapped:(id) sender;
- (IBAction)inputNumberButtonTapped:(id) sender;
- (IBAction)utilityButtonTapped:(id) sender; // <-- could be split up into different methods
- (IBAction)buyButtonTapped:(id) sender;
- (IBAction)sellButtonTapped:(id) sender;

- (IBAction)mapButtonTapped:(id) sender;


- (IBAction)gemTouched:(id) sender;

- (void) initializeCurrentCityTo: (NSString*) cityName;

@end
