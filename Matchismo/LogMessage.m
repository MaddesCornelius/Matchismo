//
//  LogMessage.m
//  Matchismo
//
//  Created by Privat on 22/04/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "LogMessage.h"

@implementation LogMessage
@synthesize content = _content;
@synthesize objects = _objects;

- (instancetype)initWithString:(NSString *)logMessage
{
    self = [super init];
    if (self)
    {
        _content = logMessage;
    }
    return self;
}
- (NSArray*) objects
{
    if (!_objects)
    {
        _objects = [[NSArray alloc]init];
    }
    return _objects;
    
}
- (void) addObjects:(NSArray *)objects
{
    NSMutableArray* currentObjects = [[self objects]mutableCopy];
    [currentObjects addObjectsFromArray:objects];
    [self setObjects:currentObjects];

}
- (NSString*)printLogMessage
{
    NSString* logMessage = [[NSString alloc]init];
    NSString* content = [@"Content: " stringByAppendingString:[self content]];
    logMessage = [logMessage stringByAppendingString:content];
    logMessage = [logMessage stringByAppendingString:@"\n"];
    logMessage = [logMessage stringByAppendingString:@"Objects:\n"];

    for (id currentobj in [self objects]) {
       logMessage = [logMessage stringByAppendingString:[currentobj description]];
        logMessage =[logMessage stringByAppendingString:@"\n"];
    }
   

    return logMessage;
}
@end
