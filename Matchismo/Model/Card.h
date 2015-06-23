//
//  Card.h
//  Matchismo
//
//  Created by Privat on 30.01.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//
@class Logger;
#import <Foundation/Foundation.h>
#import "Logger.h"

@interface Card : NSObject
@property (strong, nonatomic) NSString* contents;
@property (nonatomic, getter=isMatched) BOOL matched;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, readonly, strong) NSMutableArray* loggingArray;
@property (nonatomic, readonly, strong) Logger* logger;
- (NSMutableArray*) loggingArray;
- (int)match:(NSArray* )otherCards;
- (int)matchNumber:(int)number OfCards:(NSArray*)otherCards;
@end
