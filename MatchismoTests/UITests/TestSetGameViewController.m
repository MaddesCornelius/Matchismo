//
//  TestSetGameViewController.m
//  Matchismo
//
//  Created by Privat on 08/07/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "TestSetGameViewController.h"

@implementation TestSetGameViewController

+ (NSMutableArray*)specificSetCardDeck:(NSUInteger)numberOfCards
{
    NSMutableArray* setCardsArray = [[NSMutableArray alloc]init];
    // A perfect set since only color differs and differs in all of the cards
    //
    //
    SetCard* Card_01 = [[SetCard alloc]init];
    SetCard* Card_02 = [[SetCard alloc]init];
    SetCard* Card_03 = [[SetCard alloc]init];
    [Card_01 setSymbol:1];
    [Card_01 setNumberOfSymbols:3];
    [Card_01 setPattern:1];
    [Card_01 setColor:1];
    
    [Card_02 setSymbol:1];
    [Card_02 setNumberOfSymbols:3];
    [Card_02 setPattern:1];
    [Card_02 setColor:2];
    
    
    [Card_03 setSymbol:1];
    [Card_03 setNumberOfSymbols:3];
    [Card_03 setPattern:1];
    [Card_03 setColor:3];
    
    
    // Another Set
    SetCard* Card_04 = [[SetCard alloc]init];
    SetCard* Card_05 = [[SetCard alloc]init];
    SetCard* Card_06 = [[SetCard alloc]init];
    [Card_04 setSymbol:1];
    [Card_04 setNumberOfSymbols:1];
    [Card_04 setPattern:1];
    [Card_04 setColor:1];
    
    [Card_05 setSymbol:1];
    [Card_05 setNumberOfSymbols:2];
    [Card_05 setPattern:2];
    [Card_05 setColor:2];
    
    
    [Card_06 setSymbol:1];
    [Card_06 setNumberOfSymbols:3];
    [Card_06 setPattern:3];
    [Card_06 setColor:3];
    
    //No set, since Number of symbols is only equal for 2 cards
    SetCard* Card_07 = [[SetCard alloc]init];
    SetCard* Card_08 = [[SetCard alloc]init];
    SetCard* Card_09 = [[SetCard alloc]init];
    [Card_07 setSymbol:1];
    [Card_07 setNumberOfSymbols:3];
    [Card_07 setPattern:1];
    [Card_07 setColor:1];
    
    [Card_08 setSymbol:1];
    [Card_08 setNumberOfSymbols:3];
    [Card_08 setPattern:1];
    [Card_08 setColor:2];
    
    
    [Card_09 setSymbol:1];
    [Card_09 setNumberOfSymbols:2];
    [Card_09 setPattern:1];
    [Card_09 setColor:3];
    
    
    
   
    [setCardsArray insertObject:Card_01 atIndex:0];
    [setCardsArray insertObject:Card_02 atIndex:1];
    [setCardsArray insertObject:Card_03 atIndex:2];
    [setCardsArray insertObject:Card_04 atIndex:3];
    [setCardsArray insertObject:Card_05 atIndex:4];
    [setCardsArray insertObject:Card_06 atIndex:5];
    [setCardsArray insertObject:Card_07 atIndex:6];
    [setCardsArray insertObject:Card_08 atIndex:7];
    [setCardsArray insertObject:Card_09 atIndex:8];
  
    
    
    for (int i = 9; i < numberOfCards; i++) {
        
        SetCard* Card_rest = [[SetCard alloc]init];
        [Card_rest setSymbol:3];
        [Card_rest setNumberOfSymbols:3];
        [Card_rest setPattern:3];
        [Card_rest setColor:3];
        [setCardsArray insertObject:Card_rest atIndex:i];
    }
    
    
    return setCardsArray;
}


+ (CardMatchingGame*)demoCardMatchingGame:(NSUInteger)cardCount
{
    SetCardDeck* demoCardDeck = [[SetCardDeck alloc]init];
    
    CardMatchingGame* matchingGame = [[CardMatchingGame alloc]initWithCardCount:cardCount usingDeck:demoCardDeck];
    //Replacing the randomly drawn cards with a specific set for testing
    [matchingGame setCards:[TestSetGameViewController specificSetCardDeck:cardCount]];
    
    return matchingGame;
}

@end
