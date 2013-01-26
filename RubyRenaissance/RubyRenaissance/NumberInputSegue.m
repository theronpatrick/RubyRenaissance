//
//  NumberInputSegue.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/26/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "NumberInputSegue.h"

@implementation NumberInputSegue

- (void) perform {
 
    UIViewController *src = (UIViewController *) self.sourceViewController;
  
    UIViewController *dst = (UIViewController *) self.destinationViewController;
  
    [UIView transitionWithView:src.navigationController.view duration:0.2
    
                       options:UIViewAnimationOptionTransitionCrossDissolve
    
                    animations:^{
                     
                        [src.navigationController pushViewController:dst animated:NO];
                        
                    }
    
                    completion:NULL];
    
   
}


@end
