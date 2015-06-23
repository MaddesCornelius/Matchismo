//
//  LogMessage.h
//  Matchismo
//
//  Created by Privat on 22/04/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"

@interface LogMessage : NSObject
@property NSString* content;
@property (nonatomic, strong) NSArray* objects;
- (instancetype)initWithString:(NSString*)logMessage;
- (void)addObjects:(NSArray*) objects; // of type obj
- (NSString*)printLogMessage;
@end
