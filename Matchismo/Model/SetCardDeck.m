//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Privat on 16.04.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "SetCardDeck.h"

@implementation SetCardDeck
-(instancetype) init
{
    self = [super init];
    if (self)
    {
        for (int symbolCounter = 1;symbolCounter <=[SetCard maxNumberOfSymbols]; symbolCounter++)
        {
            for (int colorCounter = 1; colorCounter <= [SetCard maxNumberOfColors]; colorCounter++)
            {
            
                for (int patterCounter = 1; patterCounter <=[SetCard maxNumberOfPatterns]; patterCounter++) {
                    
                    for (int repetitionCounter = 1;  repetitionCounter <= [SetCard maxRepetitionsOfSymbols]; repetitionCounter++)
                    {
                        SetCard* newCard = [[SetCard alloc]init];
                        [newCard setSymbol:symbolCounter];
                        [newCard setColor:colorCounter];
                        [newCard setPattern:patterCounter];
                        [newCard setNumberOfSymbols:repetitionCounter];
                        NSLog(@"%@", [NSString stringWithFormat:@"Symbol:%d Color:%d Pattern:%d repetion: %d", [newCard symbol], [newCard color], [newCard pattern], [newCard numberOfSymbols]]);
                        [self addCard:newCard atTop:YES];
                    }
                }}
        
        }
        
        
    }
    NSLog(@"%@", [self.cards description]);
    return self;
}

@end
