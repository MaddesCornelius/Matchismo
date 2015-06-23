//
//  TestCardMatchingGame.m
//  Matchismo
//
//  Created by Privat on 20/05/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CardMatchingGame.h"
#import "SetCardDeck.h"

@interface TestCardMatchingGame : XCTestCase
@property (nonatomic, strong)CardMatchingGame* game;
@property (nonatomic, strong)SetCardDeck* setCardDeck;
@end

@implementation TestCardMatchingGame
@synthesize game = _game;
@synthesize setCardDeck = _setCardDeck;

- (void)setUp {
  
    [super setUp];
  
    CardMatchingGame* game = [[CardMatchingGame alloc]initWithCardCount:3 PossibleNumberOfMatches:3 usingDeck:[self setCardDeck]];
    
    SetCard* firstCard = [[SetCard alloc]init];
    SetCard* secondCard = [[SetCard alloc]init];
    SetCard* thirdCard = [[SetCard alloc]init];
    [firstCard setSymbol:1];
    [firstCard setNumberOfSymbols:3];
    [firstCard setPattern:1];
    [firstCard setColor:1];
    
    [secondCard setSymbol:1];
    [secondCard setNumberOfSymbols:3];
    [secondCard setPattern:1];
    [secondCard setColor:2];
    
    
    [thirdCard setSymbol:1];
    [thirdCard setNumberOfSymbols:3];
    [thirdCard setPattern:1];
    [thirdCard setColor:3];
    
    NSMutableArray* cards = [[NSMutableArray alloc]init];
    [cards addObject:firstCard];
    [cards addObject:secondCard];
    [cards addObject:thirdCard];
    [game setCards:cards];
    
    [self setGame:game];
    
    
}

- (SetCardDeck *)setCardDeck
{
if (!_setCardDeck)
{
    _setCardDeck = [[SetCardDeck alloc]init];
    
}
    return _setCardDeck;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testChooseCardAtIndex{
    [[self game]chooseCardAtIndex:0];
    [[self game]chooseCardAtIndex:1];
    [[self game]chooseCardAtIndex:2];
    NSLog(@"%@", @"this is a test");
  
}

- (void) testSelectCard
{

}



@end
