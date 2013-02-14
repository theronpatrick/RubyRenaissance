//
//  Player.h
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/30/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

+(id) sharedPlayer;

@property (strong, nonatomic) NSString* name;
@property (nonatomic) int currency;

@property (nonatomic) int malachiteCount;
@property (nonatomic) int pearlCount;
@property (nonatomic) int emeraldCount;
@property (nonatomic) int sapphireCount;
@property (nonatomic) int diamondCount;
@property (nonatomic) int rubyCount;

+ (void) resetPlayer;



@end
