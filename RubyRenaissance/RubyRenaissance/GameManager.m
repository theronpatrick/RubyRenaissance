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

-(int)getPearlPrice{
    
    //for testing
    return 17;
}

-(int)getEmeraldPrice{
    
    //for testing
    return 22;
}

-(int)getSapphirePrice{
    
    //for testing
    return 33;
}

-(int)getDiamondPrice{
    
    //for testing
    return 44;
}

-(int)getRubyPrice{
    
    //for testing
    return 56;
}



@end
