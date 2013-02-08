//
//  GameManager.m
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/30/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import "GameManager.h"



@implementation GameManager

//@synthesize malachitePrice = _malachitePrice;
//@synthesize pearlPrice = _pearlPrice;
//@synthesize emeraldPrice = _emeraldPrice;
//@synthesize sapphirePrice = _sapphirePrice;
//@synthesize diamondPrice = _diamondPrice; 
//@synthesize rubyPrice = _rubyPrice;

static GameManager *sharedGameManager;

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

static CGPoint cityOriginForSeguePoint;

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
        
        if (sharedGameManager == nil){
            
            //allocate space for objects
            sharedGameManager = [[self alloc] init];
        
        //additional setup
        
        
        //
        [self setInitialPrices];
        
        NSLog(@"New game manager created");
        
        }
    }
    
    return sharedGameManager;
}

#pragma mark Base Prices
+ (void) setInitialPrices{
    
    //used for initial setup
    baseMalachitePrice = 10;
    basePearlPrice = 30;
    baseEmeraldPrice = 110;
    baseSapphirePrice = 270;
    baseDiamondPrice = 550;
    baseRubyPrice = 1070;
    
    malachitePrice = baseMalachitePrice;
    pearlPrice = basePearlPrice;
    emeraldPrice = baseEmeraldPrice;
    sapphirePrice = baseSapphirePrice;
    diamondPrice = baseDiamondPrice;
    rubyPrice = baseRubyPrice;
    
}

#pragma mark Getters

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

- (int) getPriceForGem:(int)gemTag{
    
    switch (gemTag) {
            
        case MalachiteTag:
            return [self getMalachitePrice];
            break;
            
        case PearlTag:
            return [self getPearlPrice];
            break;
            
        case EmeraldTag:
            return [self getEmeraldPrice];
            break;
            
        case SapphireTag:
            return [self getSapphirePrice];
            break;
            
        case DiamondTag:
            return [self getDiamondPrice];
            break;
            
        case RubyTag:
            return [self getRubyPrice];
            break;
            
        default:
            NSLog(@"Tried to get price for bad gem");
            break;
    }

    return 0;
            
}
    


-(int)getBaseMalachitePrice{
    
    //for testing
    return baseMalachitePrice;
}

-(int)getBasePearlPrice{
    
    //for testing
    return basePearlPrice;
}

-(int)getBaseEmeraldPrice{
    
    //for testing
    return baseEmeraldPrice;
}

-(int)getBaseSapphirePrice{
    
    //for testing
    return baseSapphirePrice;
}

-(int)getBaseDiamondPrice{
    
    //for testing
    return baseDiamondPrice;
}

-(int)getBaseRubyPrice{
    
    //for testing
    return baseRubyPrice;
}

- (int) getBasePriceForGem:(int)gemTag{
    
    switch (gemTag) {
            
        case MalachiteTag:
            return [self getBaseMalachitePrice];
            break;
            
        case PearlTag:
            return [self getBasePearlPrice];
            break;
            
        case EmeraldTag:
            return [self getBaseEmeraldPrice];
            break;
            
        case SapphireTag:
            return [self getBaseSapphirePrice];
            break;
            
        case DiamondTag:
            return [self getBaseDiamondPrice];
            break;
            
        case RubyTag:
            return [self getBaseRubyPrice];
            break;
            
        default:
            NSLog(@"Tried to get base price for bad gem");
            break;
    }
    
    return 0;
    
}


- (void) calculatePriceForGem: (int) gemType gemPrice: (int) gemPrice fixedVariation: (float) fixedPercent variableVariation: (float) variablePercent{
    
    
    //Get random number between 0 and 1
    
    #define ARC4RANDOM_MAX      0x100000000
    double rand = ((double)arc4random() / ARC4RANDOM_MAX);
    
    
    //Calculate new price
    
    int newPrice = gemPrice * (1 + ((fixedPercent + (rand * variablePercent)) / 100));
    
  
    
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
            
            NSLog(@"Setting price for ruby and total is: ");
            NSLog([NSString stringWithFormat:@"%d", newPrice]);
            
            break;
            
        default:
            NSLog(@"Problem in setting price");
            break;
            
    }
    
    
    NSLog(@"Calculate method hit");
    
}

- (void) randomizePrices{
    
    int gemPrice = 0; 
    
    for(int i = MalachiteTag; i < RubyTag + 1; i++){
        
        gemPrice = [self getBasePriceForGem:i];
        [self calculatePriceForGem:i gemPrice:gemPrice fixedVariation:10.0 variableVariation:7.0];
        
    }
}

#pragma mark Segue Methods

- (void) setCityOriginForSegue: (CGPoint) originPoint{
    
    cityOriginForSeguePoint = originPoint;
    
}

- (CGPoint) getCityOriginForSegue{
    
    return cityOriginForSeguePoint;
}



@end
