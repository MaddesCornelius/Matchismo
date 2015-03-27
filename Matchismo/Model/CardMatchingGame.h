//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Privat on 06.02.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
//designated initializer
- (instancetype)initWithCardCount:(NSInteger)count
                        usingDeck:(Deck*)deck;
- (instancetype) initWithCardCount:(NSInteger)count PossibleNumberOfMatches:(int) numberOfMatches usingDeck:(Deck *)deck;
-(void)chooseCardAtIndex:(NSInteger)index;
-(Card*)cardAtIndex:(NSInteger)index;
@property (nonatomic, readonly)NSInteger score;
@property (nonatomic, readonly)NSInteger possibleNumberOfMatches;

@end
