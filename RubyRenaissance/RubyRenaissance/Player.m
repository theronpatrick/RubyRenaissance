//
//  Player.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/30/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "Player.h"

static Player *sharedPlayer = nil;

@implementation Player


+ (id)sharedPlayer {
    @synchronized(self) {
        if (sharedPlayer == nil)
            
            //allocate space for objects
            sharedPlayer = [[self alloc] init];
        
    }
    
    return sharedPlayer;
}

@end
