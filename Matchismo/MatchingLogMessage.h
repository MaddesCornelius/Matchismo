//
//  MatchingLogMessage.h
//  Matchismo
//
//  Created by Privat on 23/04/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//
// This class is intentened to document what is going on in card comparission. n cards can be added, an operation which was executed on them and to what result this operation led.

#import "LogMessage.h"

@interface MatchingLogMessage : LogMessage

@property NSString* operation;
@property NSString* result;



//TODO: Rewrite initializer to offer array attachements rather then cardOne and cardTwo
- (instancetype)initWithCards:(NSArray*)cards operation:(NSString*)operation result:(NSString*)result;
@end
