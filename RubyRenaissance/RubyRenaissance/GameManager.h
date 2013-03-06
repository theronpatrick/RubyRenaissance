//
//  GameManager.h
//  RubyRenaissance
//
//  Created by Theron Patrick on 1/30/13.
//  Copyright (c) 2013 Theron Patrick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameManager : NSObject

+ (id) sharedGameManager;


//+ (int) malachitePrice;
//+ (int) pearlPrice;
//+ (int) emeraldPrice;
//+ (int) sapphirePrice;
//+ (int) diamondPrice;
//+ (int) rubyPrice;

- (int) getMalachitePrice;
- (int) getPearlPrice;
- (int) getEmeraldPrice;
- (int) getSapphirePrice;
- (int) getDiamondPrice;
- (int) getRubyPrice;

- (int) getPriceForGem: (int) gemTag;
- (int) getPurchasedPriceForGem: (int) gemTag;
- (void) setPurchasedPriceForGem: (int) gemTag withPrice: (int) purchasePrice;

- (int) getDaysRemaining;
- (void) setDaysRemaining: (int) daysLeft;

- (int) getBaseMalachitePrice;
- (int) getBasePearlPrice;
- (int) getBaseEmeraldPrice;
- (int) getBaseSapphirePrice;
- (int) getBaseDiamondPrice;
- (int) getBaseRubyPrice;

- (void) setLastCity: (int) newCity;
- (int) getLastCity;

- (void) setCityOriginForSegue: (CGPoint) originPoint;
- (CGPoint) getCityOriginForSegue;

- (void) calculatePriceForGem: (int) gemType gemPrice: (int) gemPrice fixedVariation: (float) fixedPercent variableVariation: (float) variablePercent;

- (void) calculateInflation;

- (void) randomizePrices;

+ (void) resetGame;

//city special methods

- (void) determineProjectForRome;
- (void) determineDefaultProject;


- (void) financeRomeProject;
- (NSString*) getCitySpecialText;



@end
