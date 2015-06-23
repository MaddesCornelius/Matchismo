//
//  MatchingLogMessage.m
//  Matchismo
//
//  Created by Privat on 23/04/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "MatchingLogMessage.h"

@implementation MatchingLogMessage
@synthesize operation = _operation;
@synthesize result = _result;





- (instancetype)initWithCards:(NSArray *)cards operation:(NSString *)operation result:(NSString *)result
{
    self = [super init];
    if (self)
    {
    
        _operation = operation;
        _result = result;
        
        [self setObjects:cards];
        
        NSString* temp_operation = [@"Operation: " stringByAppendingString:operation];
        temp_operation = [temp_operation stringByAppendingString:@"\n "];
        NSString* temp_result = [@"Result: " stringByAppendingString:result];
         temp_result  = [temp_result stringByAppendingString:@"\n"];
        [self setContent:[temp_operation stringByAppendingString:temp_result]];
    }
    
    return self;
}
@end
