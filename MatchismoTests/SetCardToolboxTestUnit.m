//
//  SetCardToolboxTestUnit.m
//  Matchismo
//
//  Created by Privat on 07/06/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SetCardDeck.h"
#import "SetCard.h"
#import "SetCardToolbox.h"
#import "LogMessage.h"

@interface SetCardToolboxTestUnit : XCTestCase

@end

@implementation SetCardToolboxTestUnit

- (void)setUp {

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCastingOfSetCardMessage {
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
    
    Logger* logger = [firstCard logger];
    MatchingLogMessage* logMessage = [logger.logMessages objectAtIndex:0];
    NSAttributedString* castedLogMessage = [SetCardToolbox castMatchingLogMessage:logMessage];
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {

}

@end
