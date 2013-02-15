//
//  NewsEventManager.h
//  RubyRenaissance
//
//  Created by Theron Patrick on 2/15/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsEventManager : NSObject

+ (id) sharedNewsEventManager;

- (void) determineRandomNewsEvent;
- (void) setNewsEventNumber: (int) numToSet;

- (void) performNewsEvent;

- (NSString* ) getNewsEventText;

@end
