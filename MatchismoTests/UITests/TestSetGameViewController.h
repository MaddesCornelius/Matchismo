//
//  TestSetGameViewController.h
//  Matchismo
//
//  Created by Privat on 08/07/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCardDeck.h"
#import "CardMatchingGame.h"

@interface TestSetGameViewController : NSObject


+ (CardMatchingGame*)demoCardMatchingGame:(NSUInteger)cardCount;
+ (NSMutableArray*)specificSetCardDeck:(NSUInteger)cardCount;

@end
