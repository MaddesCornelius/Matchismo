//
//  PlayingCard.m
//  Matchismo
//
//  Created by Privat on 01.02.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "PlayingCard.h"



@implementation PlayingCard

@synthesize suit = _suit;
@synthesize rank =_rank;




- (NSString *)contents
{
    NSString* convertedRank = [[PlayingCard validRanks] objectAtIndex: self.rank];
    return [convertedRank stringByAppendingString:(self.suit)];
}

+ (NSArray*) validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}
+ (NSArray*) validRanks
{
    return  @[@"?",@"A",@"2",@"3",@"4",@"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    
}
+ (NSUInteger) maxRank
{
    return [[PlayingCard validRanks] count] -1;
}
-(NSString*)suit
{
    if (_suit)
    {
        return _suit;
    }
    else
    {
        return @"?";
    }
    ;
}

-(void)setSuit:(NSString *)newSuit
{
    if([[PlayingCard validSuits] containsObject:newSuit])
    {
        _suit = newSuit;
    }
}
-(void)setRank:(NSInteger)newRank
{
    if (newRank <= [PlayingCard maxRank])
    {
        _rank = newRank;
    }
}
-(int) match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count] == 1)
    {
        PlayingCard* otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank)
        {
            score = 4;
            NSString* temp = [NSString stringWithFormat:@"%@%ld and %@%ld match in rank, score + 4",[self suit], (long)[self rank], [otherCard suit], (long)[otherCard rank]];
            [self.loggingArray addObject:temp];
        } else if ([otherCard.suit isEqualToString:(self.suit)])
        {
            
            score = 1;
            NSString* temp = [NSString stringWithFormat:@"%@%ld and %@%ld match in suir, score + 1",[self suit], (long)[self rank], [otherCard suit], (long)[otherCard rank]];
            [self.loggingArray addObject:temp];
        }
    }
    else
    {
        //add all cards containing self to an array.
        NSMutableArray* allcardsArray = [[NSMutableArray alloc]init];
        [allcardsArray addObjectsFromArray:otherCards];
        [allcardsArray addObject:self];
        NSMutableArray* cardsSameRank = [[NSMutableArray alloc] init]; //ofCards
        NSMutableArray* cardsSameSuit = [[NSMutableArray alloc] init]; //ofCards
        
        for (PlayingCard* mainCard in allcardsArray)
        {
            for (PlayingCard* subCard in allcardsArray) {
                if (![subCard isEqual:mainCard] && subCard.rank == mainCard.rank
                    && ![cardsSameRank containsObject:subCard]) {
                    
                    [cardsSameRank addObject:subCard];
                    
                    if (![cardsSameRank containsObject:mainCard]) {
                        [cardsSameRank addObject:mainCard];
                    }
                    score =+4;
                    
                     NSString* temp = [NSString stringWithFormat:@"%@%ld and %@%ld match in rank, score + 4",[mainCard suit], (long)[mainCard rank], [subCard suit], (long)[subCard rank]];
                    [self.loggingArray addObject:temp];
                    
                    
                    
                }
                if (![subCard isEqual:mainCard] && subCard.suit == mainCard.suit && ![cardsSameSuit containsObject:subCard])
                {
                    [cardsSameSuit addObject:subCard];
                    if (![cardsSameSuit containsObject:mainCard]) {
                        [cardsSameSuit addObject:mainCard];
                    }
                    score =+1;
                    NSString* temp = [NSString stringWithFormat:@"%@%ld and %@%ld match in suit, score + 1",[mainCard suit], (long)[mainCard rank], [subCard suit], (long)[subCard rank]];
                    [self.loggingArray addObject:temp];
                }
            }
        }
        
    }
    
    return score ;
}

- (int) probabilityMulitplyerAttribute:(NSString*) attribute
{
  
    if ([attribute isEqualToString:(@"rank")])
    {
// In case we need to be more generice for the score than just assuming that we are dealing with a full deal
//        multiplyer = 1/
//        (
//         (1 /
//          ([[PlayingCard validRanks] count]) *
//          ([[PlayingCard validSuits] count]-1)
//        )
//     );
        return 4;
    }
    else if ([attribute isEqualToString:(@"suit")])
             {
                 return 1;
             }
    else
    {
        return 0;
    }
    
}

//TODO change is chosen and ismatched if match with two or more cards
-(int)matchNumber:(int)number OfCards:(NSArray *)otherCards
{
    return 0;
}







@end
