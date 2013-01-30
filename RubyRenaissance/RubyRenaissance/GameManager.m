//
//  GameManager.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/30/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "GameManager.h"

static GameManager *sharedGameManager = nil;

@implementation GameManager


+ (id)sharedGameManager {
    @synchronized(self) {
        if (sharedGameManager == nil)
            
            //allocate space for objects
            sharedGameManager = [[self alloc] init];
        
    }
    
    return sharedGameManager;
}

-(int)getMalachitePrice{
    
    //for testing
    return 10;
}



@end
