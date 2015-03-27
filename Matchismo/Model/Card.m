//
//  Card.m
//  Matchismo
//
//  Created by Privat on 30.01.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "Card.h"
@interface Card()
@end

@implementation Card
@synthesize contents = _contents;

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
