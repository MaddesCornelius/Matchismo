//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Privat on 01.02.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "PlayingCardDeck.h"


@implementation PlayingCardDeck
-(instancetype) init
{
    self = [super init];
    if (self)
    {
        for (NSString* suit in [PlayingCard validSuits])
        {
            for (NSInteger i = 1; i<= [PlayingCard maxRank]; i++) {
                PlayingCard* newCard = [[PlayingCard alloc]init];
                newCard.suit = suit;
                newCard.rank = i;
                [self addCard:newCard atTop:YES];
            }
        }
    
    }
    return self;
}


@end
