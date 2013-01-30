//
//  GameManager.h
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/30/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameManager : NSObject

+(id) sharedGameManager;

-(int) getMalachitePrice;

@end
