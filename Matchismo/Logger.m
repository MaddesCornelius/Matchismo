//
//  Logger.m
//  Matchismo
//
//  Created by Privat on 22/04/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "Logger.h"

@implementation Logger
@synthesize logMessages = _logMessages;
- (void) setLogMessages:(NSArray *)logMessages
{
    _logMessages = logMessages;
}
- (NSArray*) logMessages
{
    if (!_logMessages)
    {
        _logMessages = [[NSArray alloc]init];
    }
    return _logMessages;

}
-(void) addLogMessage:(LogMessage *)message
{
    NSMutableArray* temp = [[NSMutableArray alloc]initWithArray:_logMessages];
    [temp addObject:message];
    [self setLogMessages:temp];
}
@end
