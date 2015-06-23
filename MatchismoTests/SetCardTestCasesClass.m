//
//  SetCardTestCasesClass.m
//  Matchismo
//
//  Created by Privat on 18.04.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetCardTestCasesClass : XCTestCase
@property SetCardDeck* setCardDeck;
@end
@implementation SetCardTestCasesClass
@synthesize setCardDeck = _setCardDeck;
- (void)setUp {
    [super setUp];
    _setCardDeck = [[SetCardDeck alloc]init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testSetUpSetCardDeck {
    // This is an example of a functional test case.
    SetCardDeck* newDeck = [[SetCardDeck alloc]init];
    XCTAssertNotNil(newDeck);
}

- (void) testCheckCorrectCardsNumber{
 SetCardDeck* newDeck = [[SetCardDeck alloc]init];
    XCTAssertTrue([newDeck.cards count] == 81);
}

/* 
 Checks if the setCard comparision
 methods, which compare cards in symbol,
 pattern, color etc work correctly.
 Initiated with equal values for all cards,
 every property will be changed till all cards
 are completly different.
 */
- (void) testPropertyComparisonSymbolMethods
{
    SetCard* firstCard = [[SetCard alloc]init];
    SetCard* secondCard = [[SetCard alloc]init];
    SetCard* thirdCard = [[SetCard alloc]init];
    [firstCard setSymbol:1];
    [firstCard setNumberOfSymbols:1];
    [firstCard setPattern:1];
    [firstCard setColor:1];
    
    [secondCard setSymbol:1];
    [secondCard setNumberOfSymbols:1];
    [secondCard setPattern:1];
    [secondCard setColor:1];
    
    
    [thirdCard setSymbol:1];
    [thirdCard setNumberOfSymbols:1];
    [thirdCard setPattern:1];
    [thirdCard setColor:1];
    
    NSMutableArray* cards = [[NSMutableArray alloc]init];
    [cards addObject:firstCard];
    [cards addObject:secondCard];
    [cards addObject:thirdCard];
    XCTAssert([firstCard checkIfSymbolMatchesInCards:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInSymbol:cards]);
     XCTAssert([firstCard checkIfCardsMatchInColor:cards]);
     XCTAssertFalse([firstCard checkIfCardsDifferInColor:cards]);
    XCTAssert([firstCard checkIfCardsMatchInPattern:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInPattern:cards]);
    XCTAssert([firstCard checkIfCardsMatchInColor:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInColor:cards]);
    
     [secondCard setSymbol:2];
    XCTAssertFalse([firstCard checkIfSymbolMatchesInCards:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInSymbol:cards]);
    [thirdCard setSymbol:3];
    XCTAssertFalse([firstCard checkIfSymbolMatchesInCards:cards]);
    XCTAssert([firstCard checkIfCardsDifferInSymbol:cards]);
    [secondCard setNumberOfSymbols:2];
    XCTAssertFalse([firstCard checkIfCardsMatchInNumberOfSymbols:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInNumberOfSymbols:cards]);
    [thirdCard setNumberOfSymbols:3];
    XCTAssert([firstCard checkIfCardsDifferInNumberOfSymbols:cards]);
    XCTAssertFalse([firstCard checkIfCardsMatchInNumberOfSymbols:cards]);
    [secondCard setPattern:2];
    XCTAssertFalse([firstCard checkIfCardsMatchInPattern:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInPattern:cards]);
    [thirdCard setPattern:3];
    XCTAssertFalse([firstCard checkIfCardsMatchInPattern:cards]);
    XCTAssert([firstCard checkIfCardsDifferInPattern:cards]);
    
    

}



- (void) testPropertyComparisonNumberMethods
{
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
    XCTAssert([firstCard checkIfCardsMatchInNumberOfSymbols:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInNumberOfSymbols:cards]);
    [secondCard setNumberOfSymbols:2];
    XCTAssertFalse([firstCard checkIfCardsMatchInNumberOfSymbols:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInNumberOfSymbols:cards]);
    [thirdCard setNumberOfSymbols:1];
    XCTAssertFalse([firstCard checkIfCardsMatchInNumberOfSymbols:cards]);
    XCTAssert([firstCard checkIfCardsDifferInNumberOfSymbols:cards]);
}
- (void) testPropertyComparisonPatternMethods
{
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
    XCTAssert([firstCard checkIfCardsMatchInPattern:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInPattern:cards]);
    [secondCard setPattern:2];
    XCTAssertFalse([firstCard checkIfCardsMatchInPattern:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInPattern:cards]);
    [thirdCard setPattern:3];
    XCTAssertFalse([firstCard checkIfCardsMatchInPattern:cards]);
    XCTAssert([firstCard checkIfCardsDifferInPattern:cards]);
}

- (void) testPropertyComparisonColorMethods
{
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
    [secondCard setColor:1];
    
    
    [thirdCard setSymbol:1];
    [thirdCard setNumberOfSymbols:3];
    [thirdCard setPattern:1];
    [thirdCard setColor:1];
    
    NSMutableArray* cards = [[NSMutableArray alloc]init];
    [cards addObject:firstCard];
    [cards addObject:secondCard];
    [cards addObject:thirdCard];
    XCTAssert([firstCard checkIfCardsMatchInColor:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInColor:cards]);
    [secondCard setColor:2];
    XCTAssertFalse([firstCard checkIfCardsMatchInColor:cards]);
    XCTAssertFalse([firstCard checkIfCardsDifferInColor:cards]);
    [thirdCard setColor:3];
    XCTAssertFalse([firstCard checkIfCardsMatchInColor:cards]);
    XCTAssert([firstCard checkIfCardsDifferInColor:cards]);
}

- (void) testMatchMethod {
    //Asserting that if all cards match but in one property
    // - which is different for each card - a score of one is
    // given.
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
    int score = [firstCard match:@[secondCard, thirdCard]];
    XCTAssertEqual(score, 1);
    
    // Asserting that if cards match only in one property
    // but every property is different for each card
    // a score of one is given
    [firstCard setSymbol:1];
    [firstCard setNumberOfSymbols:1];
    [firstCard setPattern:1];
    [firstCard setColor:1];
    
    [secondCard setSymbol:1];
    [secondCard setNumberOfSymbols:2];
    [secondCard setPattern:2];
    [secondCard setColor:2];
    
    
    [thirdCard setSymbol:1];
    [thirdCard setNumberOfSymbols:3];
    [thirdCard setPattern:3];
    [thirdCard setColor:3];
     score = [firstCard match:@[secondCard, thirdCard]];
     XCTAssertEqual(score, 1);
    //Asserting that if two cards match in one property bu
    // the third card does not, the score is 0
    [firstCard setSymbol:1];
    [firstCard setNumberOfSymbols:3];
    [firstCard setPattern:1];
    [firstCard setColor:1];
    
    [secondCard setSymbol:1];
    [secondCard setNumberOfSymbols:3];
    [secondCard setPattern:1];
    [secondCard setColor:2];
    
    
    [thirdCard setSymbol:1];
    [thirdCard setNumberOfSymbols:2];
    [thirdCard setPattern:1];
    [thirdCard setColor:3];
    score = [firstCard match:@[secondCard, thirdCard]];
    XCTAssertEqual(score, 0);
    
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
