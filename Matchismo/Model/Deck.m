//
//  Deck.m
//  Matchismo
//
//  Created by Privat on 30.01.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "Deck.h"

@interface Deck ()
@property (strong, nonatomic) NSMutableArray* cards;
@end
@implementation Deck

-(NSMutableArray*)cards
{
    if (_cards)
    {
    return _cards;
    }
    else
    {
        _cards = [[NSMutableArray alloc]init];
        return _cards;
    }
}

-(void)addCard:(Card *)aCard atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:aCard atIndex:0];
    }
    else
    {
        [self.cards addObject:aCard];
    }
}
-(Card*)drawRandomCard
{
    Card* randomCard = nil;
    unsigned index = arc4random() % [self.cards count];
    if (index >0)
    {
    randomCard = self.cards[index];
    [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}


@end
