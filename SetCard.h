//
//  SetGameCard.h
//  Matchismo
//
//  Created by Privat on 16.04.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "Card.h"
#import "Logger.h"


@interface SetCard : Card
@property int symbol;
@property int numberOfSymbols;
@property int pattern;
@property int color;
@property (nonatomic, readonly)Logger* logger;

+ (int) maxNumberOfSymbols;
+ (int) maxRepetitionsOfSymbols;
+ (int) maxNumberOfPatterns;
+ (int) maxNumberOfColors;
- (BOOL)checkIfSymbolMatchesInCards:(NSArray*) cards;
- (BOOL)checkIfCardsDifferInSymbol:(NSArray*) cards;
- (BOOL)checkIfCardsMatchInNumberOfSymbols:(NSArray*) cards;
- (BOOL)checkIfCardsDifferInNumberOfSymbols:(NSArray*) cards;
- (BOOL)checkIfCardsMatchInPattern:(NSArray*) cards;
- (BOOL)checkIfCardsDifferInPattern:(NSArray*) cards;
- (BOOL)checkIfCardsMatchInColor:(NSArray*) cards;
- (BOOL)checkIfCardsDifferInColor:(NSArray*) cards;

- (NSString *)description;
- (int)match:(NSArray *)otherCards;
@end
