//
//  HistoryViewControllerTest.m
//  Matchismo
//
//  Created by Privat on 10/06/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SetCard.h"
#import "HistoryViewController.h"

@interface HistoryViewControllerTest : XCTestCase
@property HistoryViewController* currentView;
@end

@implementation HistoryViewControllerTest
@synthesize currentView = _currentView;

- (void)setUp {
    [super setUp];
    NSArray* log = [self setUpMatchingLogForPerfectSet];
    _currentView = [[HistoryViewController alloc]initWithMatchingHistory:log];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (NSArray*) setUpMatchingLogForPerfectSet
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
    [firstCard match:@[secondCard, thirdCard]];
    return [firstCard.logger logMessages];
}

- (void)testDisplaySetCardLogs {
    
  //[]
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
