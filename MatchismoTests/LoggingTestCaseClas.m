//
//  LoggingTestCaseClas.m
//  Matchismo
//
//  Created by Privat on 28/04/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "LogMessage.h"
#import "SetCard.h"

@interface LoggingTestCaseClas : XCTestCase

@end

@implementation LoggingTestCaseClas

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



- (void)testPrintLogMessage {
    LogMessage* logMessage = [[LogMessage alloc]initWithString:@"This is a random logging message"];
   
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
    NSArray* tempArray = [[NSArray alloc]initWithObjects:firstCard, secondCard, thirdCard, nil];
    [logMessage addObjects:tempArray];
    NSLog(@"%@", [logMessage printLogMessage]);
     
}

@end
