//
//  StandardModalSegue.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 2/5/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "StandardModalSegue.h"
#import "QuartzCore/QuartzCore.h"

@implementation StandardModalSegue

- (void) perform
{
    // Add your own animation code here.
    
    
    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
    UIViewController *destinationController = (UIViewController*)[self destinationViewController];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 2.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromLeft; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    
    
    //[sourceViewController.view.layer addAnimation:transition forKey:kCATransition];
    [destinationController.view.layer addAnimation:transition forKey:kCATransition];

    //added this
    [sourceViewController.view addSubview:destinationController.view];
    
    [[self sourceViewController] presentViewController:[self destinationViewController] animated:YES completion:nil];
    
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
    
    // fourth try
    
//    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
//        UIViewController *destinationController = (UIViewController*)[self destinationViewController];
//    
//    [UIView transitionFromView:sourceViewController.view
//                        toView:destinationController.view
//                      duration:1.0f
//                       options:UIViewAnimationOptionTransitionFlipFromLeft
//                    completion:nil];
    
}

@end
