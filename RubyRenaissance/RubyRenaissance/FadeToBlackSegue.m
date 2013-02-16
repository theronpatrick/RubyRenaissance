//
//  FadeToBlackSegue.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 2/16/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "FadeToBlackSegue.h"

@implementation FadeToBlackSegue

- (void) perform{
    
    UIViewController *sourceController = self.sourceViewController;
    UIViewController *destinationController = self.destinationViewController;
    
    
    //make black screen
    CGRect blackScreenRect = CGRectMake(destinationController.view.bounds.origin.x,
                                      destinationController.view.bounds.origin.y,
                                      destinationController.view.bounds.size.width,
                                      destinationController.view.bounds.size.height); 

    UIView* blackView = [[UIView alloc] initWithFrame:blackScreenRect];
    
    blackView.backgroundColor = [UIColor blackColor];
    
    
    //add subviews
    
    
    [sourceController.view addSubview:destinationController.view];
    [sourceController.view addSubview:blackView];
    
    
    
    //set new values
    
    [blackView setAlpha:0.0];
    destinationController.view.hidden = true;
    
    
    
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         [blackView setAlpha:1.0];
                         
                     }
                     completion:^(BOOL finished){
                         
                         //second animation block
                         
                         [UIView animateWithDuration:0.7
                                               delay:0.0
                                             options: UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              
                                              [blackView setAlpha:0.0];
                                              //[destinationController.view setAlpha:1.0];
                                              destinationController.view.hidden = false;
                                              
                                              
                                          }
                                          completion:^(BOOL finished){
                                              [[sourceController.view.subviews lastObject] removeFromSuperview];
                                              [[sourceController.view.subviews lastObject] removeFromSuperview];
                                              [sourceController presentViewController:destinationController animated:NO completion:nil];
                                              
                                          }
                          ];
                         
                    
                         
                     }
     ];
    
    
    
}


@end
