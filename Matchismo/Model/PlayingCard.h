//
//  PlayingCard.h
//  Matchismo
//
//  Created by Privat on 01.02.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString* suit;
@property (nonatomic) NSInteger rank;

+ (NSArray*) validSuits;
+ (NSArray*) validRanks;
+ (NSUInteger) maxRank;

@end
