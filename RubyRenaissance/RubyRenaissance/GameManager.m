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

//@synthesize malachitePrice = _malachitePrice;
//@synthesize pearlPrice = _pearlPrice;
//@synthesize emeraldPrice = _emeraldPrice;
//@synthesize sapphirePrice = _sapphirePrice;
//@synthesize diamondPrice = _diamondPrice; 
//@synthesize rubyPrice = _rubyPrice;

static int malachitePrice;
static int pearlPrice;
static int emeraldPrice;
static int sapphirePrice;
static int diamondPrice;
static int rubyPrice;

static int baseMalachitePrice;
static int basePearlPrice;
static int baseEmeraldPrice;
static int baseSapphirePrice;
static int baseDiamondPrice;
static int baseRubyPrice;

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


+ (id)sharedGameManager {
    @synchronized(self) {
        if (sharedGameManager == nil)
            
            //allocate space for objects
            sharedGameManager = [[self alloc] init];
        
        //additional setup
        
        
        //
        [self setInitialPrices];
        
        
    }
    
    return sharedGameManager;
}

#pragma mark Base Prices
+ (void) setInitialPrices{
    
    //used for initial setup
    baseMalachitePrice = 1;
    basePearlPrice = 3;
    baseEmeraldPrice = 11;
    baseSapphirePrice = 27;
    baseDiamondPrice = 55;
    baseRubyPrice = 107;
    
    malachitePrice = baseMalachitePrice;
    pearlPrice = basePearlPrice;
    emeraldPrice = baseEmeraldPrice;
    sapphirePrice = baseSapphirePrice;
    diamondPrice = baseDiamondPrice;
    rubyPrice = baseRubyPrice;
    
}

-(int)getMalachitePrice{
    
    //for testing
    return malachitePrice;
}

-(int)getPearlPrice{
    
    //for testing
    return pearlPrice;
}

-(int)getEmeraldPrice{
    
    //for testing
    return emeraldPrice;
}

-(int)getSapphirePrice{
    
    //for testing
    return sapphirePrice;
}

-(int)getDiamondPrice{
    
    //for testing
    return diamondPrice;
}

-(int)getRubyPrice{
    
    //for testing
    return rubyPrice;
}

- (void) calculatePriceForGem: (int) gemType gemPrice: (int) gemPrice percentFluctuation: (float) fluctuation skewUp: (bool) skewUp{
    
    //Calculate new price
    float amountToChange = gemPrice * fluctuation;
    int newPrice;
    
    if(skewUp == true){
        newPrice = gemPrice + amountToChange;
    }
    else{
        newPrice = gemPrice - amountToChange;
    }
    
    //store new price in appropriate gem
    
    switch(gemType){
        case MalachiteTag:
            malachitePrice = newPrice;
            break;
            
        case PearlTag:
            pearlPrice = newPrice;
            break;
        
        case EmeraldTag:
            emeraldPrice = newPrice;
            break;
            
        case SapphireTag:
            sapphirePrice = newPrice;
            break;
            
        case DiamondTag:
            diamondPrice = newPrice;
            break;
            
        case RubyTag:
            rubyPrice = newPrice;
            break;
            
        default:
            NSLog(@"Problem in setting price");
            break;
            
    }
    
    
}



@end
