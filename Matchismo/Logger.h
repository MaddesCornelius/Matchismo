//
//  Logger.h
//  Matchismo
//
//  Created by Privat on 22/04/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//
@class Card;
@class LogMessage;
#import <Foundation/Foundation.h>
#import "Card.h"
#import "LogMessage.h"

@interface Logger : NSObject
@property (nonatomic, strong, readonly) NSArray* logMessages; //of Type LogMessage
- (LogMessage*)lastLogMessagesForCard:(Card*)card;
- (void) addLogMessage:(LogMessage*)message;
@end
