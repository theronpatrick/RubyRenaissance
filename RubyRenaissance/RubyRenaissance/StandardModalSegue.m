//
//  StandardModalSegue.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 2/5/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "StandardModalSegue.h"
#import "QuartzCore/QuartzCore.h"
#import "GameManager.h"

@implementation StandardModalSegue


- (void) perform
{
    // Add your own animation code here.
    
    
//    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
//    UIViewController *destinationController = (UIViewController*)[self destinationViewController];
//    
//    CATransition* transition = [CATransition animation];
//    transition.duration = 2.5f;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    transition.type = kCATransitionPush; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
//    transition.subtype = kCATransitionFromLeft; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
//    
//
//    
//    
//    [destinationController.view.layer addAnimation:transition forKey:kCATransition];
//    
//    //[destinationController.view addSubview:sourceViewController.view];
//    
//    //move current view off screen
//    
//    
//
//
//    
//    [[self sourceViewController] presentViewController:[self destinationViewController] animated:NO completion:nil];
    
    
    //presentViewController:animated:completion:
    
    
    
    
    
    // second try
    
//    UIViewController *source = (UIViewController *) self.sourceViewController;
//    UIViewController *dest = (UIViewController *) self.destinationViewController;
//    
//    
//    [UIView transitionWithView:source.view duration:10.0 options:UIViewAnimationOptionTransitionFlipFromLeft
//                    animations:^{
//                        //dest.view.frame = CGRectMake(100, 100, 800, 500);
//                        [[self sourceViewController] presentModalViewController:[self destinationViewController] animated:YES];
//                        
//                        NSLog(@"Does this hit?");
//                    }
//                    completion:NULL];
    
    
    
    //third try
    
//    UIViewController *src = (UIViewController *) self.sourceViewController;
//    
//    [UIView transitionWithView:src.navigationController.view duration:1.0
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:^{
//                        [[self sourceViewController] presentModalViewController:[self destinationViewController] animated:YES];
//                    }
//                    completion:NULL];
    
    // fourth try -- WORKING!!!
    
//    UIViewController *sourceController = self.sourceViewController;
//    UIViewController *destinationController = self.destinationViewController;
//    
//    [sourceController.view addSubview:destinationController.view];
//    
//    destinationController.view.center = CGPointMake(destinationController.view.center.x, destinationController.view.center.y-600);
//    
//    [UIView animateWithDuration:1
//                     animations:^{
//                         destinationController.view.center = CGPointMake(destinationController.view.center.x, [[UIScreen mainScreen] bounds].size.height/2);
//                     }
//                     completion:^(BOOL finished){
//                         [[sourceController.view.subviews lastObject] removeFromSuperview];
//                         [sourceController presentViewController:destinationController animated:NO completion:nil];
//                         
//                     }
//     ];
    
    // fourth.5 try, expanding from middle
    
    UIViewController *sourceController = self.sourceViewController;
    UIViewController *destinationController = self.destinationViewController;
    
    [sourceController.view addSubview:destinationController.view];
    
    //TODO: Set from each city's little box and we have a winner
    
    //setup game manager object and origin from it
    GameManager* myGameManager = [GameManager sharedGameManager];
    
    //make new frame for destination view
    CGPoint newCenterPoint = [myGameManager getCityOriginForSegue];
    
    CGPoint originalCenter = destinationController.view.center;

    
    [destinationController.view setCenter:newCenterPoint];
    

    
    
    //set new values
    
    [destinationController.view setTransform:CGAffineTransformMakeScale(0.1,0.1)];
    
    
    
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         [destinationController.view setCenter:originalCenter];
                         [destinationController.view setTransform:CGAffineTransformIdentity];
                        
                         
                         //might make something go boom
                         
//                         NSLog(@"X in animation");
//                         NSLog([NSString stringWithFormat:@"%f", destinationController.view.frame.origin.x]);
//                         NSLog(@"Y in animation");
//                         NSLog([NSString stringWithFormat:@"%f", destinationController.view.frame.origin.y]);
                         
                     }
                     completion:^(BOOL finished){
                         [[sourceController.view.subviews lastObject] removeFromSuperview];
                         [sourceController presentViewController:destinationController animated:NO completion:nil];
                         
                     }
     ];
    
    // fifth try -- seems to work pretty good
    
    
//    
//    UIViewController *sourceViewController = (UIViewController *) self.sourceViewController;
//    UIViewController *destinationViewController = (UIViewController *) self.destinationViewController;
//    [sourceViewController.view addSubview:destinationViewController.view];
//    [destinationViewController.view setFrame:sourceViewController.view.window.frame];
//    [destinationViewController.view setTransform:CGAffineTransformMakeTranslation(0, -sourceViewController.view.frame.size.height)];
//    [destinationViewController.view setAlpha:1.0];
//    
//    [UIView animateWithDuration:2.5f
//                          delay:0.0
//                        options:UIViewAnimationOptionTransitionFlipFromTop
//                     animations:^{
//                         [destinationViewController.view setTransform:CGAffineTransformMakeTranslation(0, 0)];
//                         [destinationViewController.view setAlpha:1.0];
//                     }
//                     completion:^(BOOL finished){
//                         [destinationViewController.view removeFromSuperview];
//                         [sourceViewController presentViewController:destinationViewController animated:NO completion:nil];
//                     }];

    //sixth try, getting pretty old
    
//    __block UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
//    __block UIViewController *destinationController = (UIViewController*)[self destinationViewController];
//    
//    CATransition* transition = [CATransition animation];
//    transition.duration = 2.5f;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    transition.type = kCATransitionMoveIn; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
//    transition.subtype = kCATransitionFromLeft; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
//    
//    [destinationController.view.layer addAnimation:transition
//                                                                forKey:kCATransition];
//    
//    //[sourceViewController.navigationController pushViewController:destinationController animated:NO];
//    
//    [[self sourceViewController] presentViewController:[self destinationViewController] animated:NO completion:nil];
    
}

@end
