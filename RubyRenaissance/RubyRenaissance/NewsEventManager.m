//
//  NewsEventManager.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 2/15/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "NewsEventManager.h"
#import "GameManager.h"

@implementation NewsEventManager

static NewsEventManager* sharedNewsEventManager;

static int TotalNumberOfEvents = 12;

static int newsEventNumber;
static NSString* newsEventText;

GameManager* myGameManager;

// enums for gems
typedef enum {
    NoGemTag = 10,
    MalachiteTag = 11,
    PearlTag = 12,
    EmeraldTag = 13,
    SapphireTag = 14,
    DiamondTag = 15,
    RubyTag = 16
} GemTag;

+ (id)sharedNewsEventManager {
    @synchronized(self) {
        
        if (sharedNewsEventManager == nil){
            
            //allocate space for objects
            sharedNewsEventManager = [[self alloc] init];
            
            //additional setup
            
            myGameManager = [GameManager sharedGameManager];
          
  
            
            NSLog(@"New News Event Manager Created");
            
        }
    }
    
    return sharedNewsEventManager;
}

- (void) determineRandomNewsEvent{
    
    // this assumes a 50% chance of news
    int rand = arc4random() % (TotalNumberOfEvents * 2);
    
    newsEventNumber = rand;
    
    
}

- (void) setNewsEventNumber: (int) numToSet{
    
    newsEventNumber = numToSet;
    
}

- (NSString*) getNewsEventText{
    
    return newsEventText;
    
}

- (void) performNewsEvent{
    
    //maybe not the best way to select news events, but yolo
    
    switch (newsEventNumber){
            
        case 0:
            [self malachitePriceUp];
            break;
        
        case 1:
            [self malachitePriceDown];
            break;
            
        case 2:
            [self pearlPriceUp];
            break;
        
        case 3:
            [self pearlPriceDown];
            break;
        
        case 4:
            [self emeraldPriceUp];
            break;
        
        case 5:
            [self emeraldPriceDown];
            break;
            
        case 6:
            [self sapphirePriceUp];
            break;
            
        case 7:
            [self sapphirePriceDown];
            break;
            
        case 8:
            [self diamondPriceUp];
            break;
            
        case 9:
            [self diamondPriceDown];
            break;
            
        case 10:
            [self rubyPriceUp];
            break;
            
        case 11:
            [self rubyPriceDown];
            break;
        
        default:
            //no news
            newsEventText = @"No news";
            break;
            
    }
    
    
}

#pragma mark Event Methods

- (void) malachitePriceUp{
    
    int gemPrice = [myGameManager getPriceForGem:MalachiteTag];
    
    [myGameManager calculatePriceForGem:MalachiteTag gemPrice:gemPrice fixedVariation:10.0 variableVariation:4.0];
    
    newsEventText = @"Price of malachites has gone up!";
    
}

- (void) malachitePriceDown{
    
    int gemPrice = [myGameManager getPriceForGem:MalachiteTag];
    
    [myGameManager calculatePriceForGem:MalachiteTag gemPrice:gemPrice fixedVariation:-10.0 variableVariation:-4.0];
    
    newsEventText = @"Price of malachites has gone down!";
    
}

- (void) pearlPriceUp{
    
    int gemPrice = [myGameManager getPriceForGem:PearlTag];
    
    [myGameManager calculatePriceForGem:PearlTag gemPrice:gemPrice fixedVariation:10.0 variableVariation:4.0];
    
    newsEventText = @"Price of pearls has gone up!";
    
}

- (void) pearlPriceDown{
    
    int gemPrice = [myGameManager getPriceForGem:PearlTag];
    
    [myGameManager calculatePriceForGem:PearlTag gemPrice:gemPrice fixedVariation:-10.0 variableVariation:-4.0];
    
    newsEventText = @"Price of pearls has gone down!";
    
}

- (void) emeraldPriceUp{
    
    int gemPrice = [myGameManager getPriceForGem:EmeraldTag];
    
    [myGameManager calculatePriceForGem:EmeraldTag gemPrice:gemPrice fixedVariation:10.0 variableVariation:4.0];
    
    newsEventText = @"Price of emeralds has gone up!";
    
}

- (void) emeraldPriceDown{
    
    int gemPrice = [myGameManager getPriceForGem:EmeraldTag];
    
    [myGameManager calculatePriceForGem:EmeraldTag gemPrice:gemPrice fixedVariation:-10.0 variableVariation:-4.0];
    
    newsEventText = @"Price of emeralds has gone down!";
    
}

- (void) sapphirePriceUp{
    
    int gemPrice = [myGameManager getPriceForGem:SapphireTag];
    
    [myGameManager calculatePriceForGem:SapphireTag gemPrice:gemPrice fixedVariation:10.0 variableVariation:4.0];
    
    newsEventText = @"Price of sapphires has gone up!";
    
}

- (void) sapphirePriceDown{
    
    int gemPrice = [myGameManager getPriceForGem:SapphireTag];
    
    [myGameManager calculatePriceForGem:SapphireTag gemPrice:gemPrice fixedVariation:-10.0 variableVariation:-4.0];
    
    newsEventText = @"Price of sapphires has gone down!";
    
}

- (void) diamondPriceUp{
    
    int gemPrice = [myGameManager getPriceForGem:DiamondTag];
    
    [myGameManager calculatePriceForGem:DiamondTag gemPrice:gemPrice fixedVariation:10.0 variableVariation:4.0];
    
    newsEventText = @"Price of diamonds has gone up!";
    
}

- (void) diamondPriceDown{
    
    int gemPrice = [myGameManager getPriceForGem:DiamondTag];
    
    [myGameManager calculatePriceForGem:DiamondTag gemPrice:gemPrice fixedVariation:-10.0 variableVariation:-4.0];
    
    newsEventText = @"Price of diamonds has gone down!";
    
}

- (void) rubyPriceUp{
    
    int gemPrice = [myGameManager getPriceForGem:RubyTag];
    
    [myGameManager calculatePriceForGem:RubyTag gemPrice:gemPrice fixedVariation:10.0 variableVariation:4.0];
    
    newsEventText = @"Price of rubies has gone up!";
    
}

- (void) rubyPriceDown{
    
    int gemPrice = [myGameManager getPriceForGem:RubyTag];
    
    [myGameManager calculatePriceForGem:RubyTag gemPrice:gemPrice fixedVariation:-10.0 variableVariation:-4.0];
    
    newsEventText = @"Price of rubies has gone down!";
    
}

@end
