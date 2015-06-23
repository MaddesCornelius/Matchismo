//
//  Card.m
//  Matchismo
//
//  Created by Privat on 30.01.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "Card.h"

@interface Card ()
-(void)addToLogString:(NSString*) log;
@end
@implementation Card
@synthesize contents = _contents;
@synthesize loggingArray = _loggingArray;
@synthesize logger = _logger;

- (Logger*)logger
{
if (!_logger)
{

    _logger = [[Logger  alloc]init];
}
    return _logger;
}


- (void)addToLogString:(NSString *)log
{
    [self.loggingArray addObject:log];
}


- (NSMutableArray*) loggingArray
{
    if (!_loggingArray)
    {
        _loggingArray = [[NSMutableArray alloc]init];
    }
    
    return _loggingArray;
}



-(int)match:(NSArray *)otherCards
{
    for (int i = 0; i<[otherCards count] - 1; i++)
    {
        if ([[[otherCards objectAtIndex:i] contents] isEqualToString:self.contents])
            {
            
                return 1;
            }
    }
    return 0;
}
//stub for matching with multiple matches. Is only implemented in child class.
//TODO: Delete this method if only implemented in child class and not needed in this super - class
-(int)matchNumber:(int)number OfCards:(NSArray *)otherCards
{
    return 0;
}
    
    




@end
