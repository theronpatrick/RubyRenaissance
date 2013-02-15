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

static int purchasedMalachitePrice;
static int purchasedPearlPrice;
static int purchasedEmeraldPrice;
static int purchasedSapphirePrice;
static int purchasedDiamondPrice;
static int purchasedRubyPrice;

static int baseMalachitePrice;
static int basePearlPrice;
static int baseEmeraldPrice;
static int baseSapphirePrice;
static int baseDiamondPrice;
static int baseRubyPrice;

static int lastCity;
static int daysRemaining;

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

// enums for cities
typedef enum {
    NoCityTag = 20,
    MilanTag = 21,
    VeniceTag = 22,
    LuccaTag = 23,
    FlorenceTag = 24,
    RomeTag = 25,
    NaplesTag = 26
} CityTag;


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
    
    purchasedMalachitePrice = 0;
    purchasedPearlPrice = 0;
    purchasedEmeraldPrice = 0;
    purchasedSapphirePrice = 0;
    purchasedDiamondPrice = 0;
    purchasedRubyPrice = 0;
    
    lastCity = NoCityTag;
    daysRemaining = 10;
    
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

- (int) getPurchasedPriceForGem:(int)gemTag{
    
    switch (gemTag) {
            
        case MalachiteTag:
            return purchasedMalachitePrice;
            break;
            
        case PearlTag:
            return purchasedPearlPrice;
            break;
            
        case EmeraldTag:
            return purchasedEmeraldPrice;
            break;
            
        case SapphireTag:
            return purchasedSapphirePrice;
            break;
            
        case DiamondTag:
            return purchasedDiamondPrice;
            break;
            
        case RubyTag:
            return purchasedRubyPrice;
            break;
            
        default:
            NSLog(@"Tried to get purchased price for bad gem");
            break;
    }
    
    return 0;
}

- (void) setPurchasedPriceForGem:(int)gemTag withPrice:(int)purchasePrice{

        
        switch (gemTag) {
                
            case MalachiteTag:
                purchasedMalachitePrice = purchasePrice;
                break;
                
            case PearlTag:
                purchasedPearlPrice = purchasePrice;
                break;
                
            case EmeraldTag:
                purchasedEmeraldPrice = purchasePrice;
                break;
                
            case SapphireTag:
                purchasedSapphirePrice = purchasePrice;
                break;
                
            case DiamondTag:
                purchasedDiamondPrice = purchasePrice;
                break;
                
            case RubyTag:
                purchasedRubyPrice = purchasePrice;
                break;
                
            default:
                NSLog(@"Tried to set purchased price for bad gem");
                break;
        }
        
     
    
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

- (int) getLastCity{
    return lastCity;
}

- (void) setLastCity: (int) newCity{
    lastCity = newCity;
}

- (void) setBasePriceForGem:(int)gemTag newPrice: (int) newPrice{
    
    switch (gemTag) {
            
        case MalachiteTag:
            baseMalachitePrice = newPrice;
            break;
            
        case PearlTag:
            basePearlPrice = newPrice;
            break;
            
        case EmeraldTag:
            baseEmeraldPrice = newPrice;
            break;
            
        case SapphireTag:
            baseSapphirePrice = newPrice;
            break;
            
        case DiamondTag:
            baseDiamondPrice = newPrice;
            break;
            
        case RubyTag:
            baseRubyPrice = newPrice;
            break;
            
        default:
            NSLog(@"Tried to set price for bad gem");
            break;
    }
    
    
    
}

- (int) getDaysRemaining{
    
    return daysRemaining;
    
}

- (void) setDaysRemaining:(int)daysLeft{
    
    daysRemaining = daysLeft;
}


- (void) calculatePriceForGem: (int) gemType gemPrice: (int) gemPrice fixedVariation: (float) fixedPercent variableVariation: (float) variablePercent{
    
    
    //Get random number between 0 and 1
    
    #define ARC4RANDOM_MAX      0x100000000
    double rand = ((double)arc4random() / ARC4RANDOM_MAX);
    
    //NSLog(@"Random number between 0 and 1 is");
    //NSLog([NSString stringWithFormat:@"%f", rand]);
    
    
    
    
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
            
            //NSLog(@"Setting price for ruby and total is: ");
            //NSLog([NSString stringWithFormat:@"%d", newPrice]);
            
            break;
            
        default:
            NSLog(@"Problem in setting price");
            break;
            
    }
    
    
    //NSLog(@"Calculate method hit");
    
}

- (void) randomizePrices{
    
    int gemPrice = 0;
    
    //variation variables set here
    float fixedVariationFloat = 12.0;
    float variableVariationFloat = 9.0;
    
    for(int i = MalachiteTag; i < RubyTag + 1; i++){
        
        gemPrice = [self getBasePriceForGem:i];
        
        //set up or down
        float rand = arc4random_uniform(99);
        
        if (rand > 49 ){
            variableVariationFloat = -variableVariationFloat;
            //NSLog(@"Skewed down");
        }
        
        [self calculatePriceForGem:i gemPrice:gemPrice fixedVariation: fixedVariationFloat variableVariation: variableVariationFloat];
        
    }
}

- (void) calculateInflation{
    
    int gemPrice = 0;
    int inflationRate = 1.02;
    
    for(int i = MalachiteTag; i < RubyTag + 1; i++){
        
        gemPrice = [self getBasePriceForGem:i];
        
        //set increase
        gemPrice = gemPrice * inflationRate;
        
        [self setBasePriceForGem:i newPrice:gemPrice];
        
        //special case, small numbers
        
        if(gemPrice < 30){
            
            float rand = arc4random_uniform(99);
            
            //NSLog(@"Random number made is:");
            //NSLog([NSString stringWithFormat:@"%f", rand]);
                  
            
            // 20% chance goes up, 10% down, 70% no change
            if (rand > 80){
            gemPrice = gemPrice + 1;
            }
            
            if (rand < 9){
                gemPrice = gemPrice - 1;
            }
            
            
            
            [self setBasePriceForGem:i newPrice:gemPrice];
        }
        
    }
    
}

#pragma mark Segue Methods

- (void) setCityOriginForSegue: (CGPoint) originPoint{
    
    cityOriginForSeguePoint = originPoint;
    
}

- (CGPoint) getCityOriginForSegue{
    
    return cityOriginForSeguePoint;
}

+ (void) resetGame{
    sharedGameManager = nil;
}



@end
