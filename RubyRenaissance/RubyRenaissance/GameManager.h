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

- (int) getBaseMalachitePrice;
- (int) getBasePearlPrice;
- (int) getBaseEmeraldPrice;
- (int) getBaseSapphirePrice;
- (int) getBaseDiamondPrice;
- (int) getBaseRubyPrice;

- (void) setCityOriginForSegue: (CGPoint) originPoint;
- (CGPoint) getCityOriginForSegue;

- (void) calculatePriceForGem: (int) gemType gemPrice: (int) gemPrice fixedVariation: (float) fixedPercent variableVariation: (float) variablePercent;

- (void) randomizePrices;




@end
