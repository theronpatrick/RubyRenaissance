//
//  MainMenuController.h
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/30/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *startNewGameButton;

- (IBAction)startNewGame:(id) sender;

@end
