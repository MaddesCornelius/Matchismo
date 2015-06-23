//
//  SetGameCard.m
//  Matchismo
//
//  Created by Privat on 16.04.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "SetCard.h"

#import "MatchingLogMessage.h"

@implementation SetCard
@synthesize symbol = _symbol;
@synthesize numberOfSymbols = _numberOfSymbols;
@synthesize pattern = _pattern;
@synthesize color = _color;
@synthesize loggingArray = _loggingArray;
@synthesize logger = _logger;


+ (int) maxNumberOfSymbols
{
    return 3;
}
+ (int) maxRepetitionsOfSymbols;
{
    return 3;
}
+ (int) maxNumberOfPatterns;
{
    return 3;
}
+ (int) maxNumberOfColors;
{
    return 3;
}

- (Logger*)logger {

if (!_logger)
{
    _logger = [[Logger alloc]init];
}
    return _logger;
}

- (void)setLogger:(Logger*)logger

{
    _logger = logger;

}
- (void)addToLogger:(LogMessage *)log
{
    Logger* logger = [self logger];
    [logger addLogMessage:log];
    [self setLogger:logger];
}

- (NSMutableArray*) loggingArray
{
    if (!_loggingArray)
    {
        _loggingArray = [[NSMutableArray alloc]init];
    }
    
    return _loggingArray;
}

- (BOOL)checkIfSymbolMatchesInCards:(NSArray*) cards
{
    BOOL match = YES;
    SetCard* leadCard = (SetCard*) [cards objectAtIndex:0];
    int leadSymbol = [leadCard symbol];
    int currentIndex = 1;
    while (currentIndex < [cards count] && match == YES)
    {
        SetCard* currentCard = [cards objectAtIndex:currentIndex];
        if ([currentCard symbol] != leadSymbol)
        {
            match = NO;
            MatchingLogMessage* message = [[MatchingLogMessage alloc]initWithCards:cards operation:@"Check if symbols match in all cards." result:@"No, the symbols don't match in all cards"];
            
            [self addToLogger:message];
        }
        currentIndex++;
    }
 
   
    return match;
}

- (BOOL)checkIfCardsDifferInSymbol:(NSArray*) cards
{
    BOOL differ = YES;
    SetCard* leadCard = (SetCard*) [cards objectAtIndex:0];
    int leadSymbol = [leadCard symbol];
    int currentIndex = 1;
    while (currentIndex < [cards count] && differ == YES)
    {
        SetCard* currentCard = [cards objectAtIndex:currentIndex];
        if ([currentCard symbol] == leadSymbol)
        {
            differ = NO;
           MatchingLogMessage* message = [[MatchingLogMessage alloc]initWithCards:cards operation:@"Check if symbol differ in all cards." result:@"No, the symbols don't differ in all cards"];
            [self addToLogger:message];
        }
        currentIndex++;
    }
    return differ;

}

- (BOOL)checkIfCardsMatchInNumberOfSymbols:(NSArray*)cards
{
    
    BOOL match = YES;
    SetCard* leadCard = (SetCard*) [cards objectAtIndex:0];
    int leadNumber = [leadCard numberOfSymbols];
    int currentIndex = 1;
    while (currentIndex < [cards count] && match == YES)
    {
        SetCard* currentCard = [cards objectAtIndex:currentIndex];
        if ([currentCard numberOfSymbols] != leadNumber)
        {
            match = NO;
            MatchingLogMessage* message = [[MatchingLogMessage alloc]initWithCards:cards operation:@"Check if number symbols match in all cards." result:@"No, the number of symbols doesn't match in all cards"];
            [self addToLogger:message];
        }
        currentIndex++;
    }
    return match;
}
- (BOOL)checkIfCardsDifferInNumberOfSymbols:(NSArray*) cards
{
 
    BOOL differ = YES;
    SetCard* leadCard = (SetCard*) [cards objectAtIndex:0];
    int leadNumberOfSymbols = [leadCard numberOfSymbols];
    int currentIndex = 1;
    while (currentIndex < [cards count] && differ == YES)
    {
        SetCard* currentCard = [cards objectAtIndex:currentIndex];
        if ([currentCard numberOfSymbols] == leadNumberOfSymbols)
        {
            differ = NO;
             MatchingLogMessage* message = [[MatchingLogMessage alloc]initWithCards:cards operation:@"Check if the number of symbols differ in all cards." result:@"No, the number of symbols doesn't differ in all cards"];
            [self addToLogger:message];
        }
        currentIndex++;
    }
    return differ;
}

- (BOOL)checkIfCardsMatchInPattern:(NSArray*) cards
{
    
    BOOL match = YES;
    
    SetCard* leadCard = (SetCard*) [cards objectAtIndex:0];
    int leadPattern = [leadCard pattern];
    int currentIndex = 1;
    
    
    while (currentIndex < [cards count] && match == YES)
    {
        
        SetCard* currentCard = [cards objectAtIndex:currentIndex];
        if ([currentCard pattern] != leadPattern)
        {
            match = NO;
              MatchingLogMessage* message = [[MatchingLogMessage alloc]initWithCards:cards operation:@"Check if pattern match in all cards." result:@"No, the paterns don't match in all cards"];
            [self addToLogger:message];
            
        }
        currentIndex++;
        
    }
    
    return match;
}

- (BOOL)checkIfCardsDifferInPattern:(NSArray*) cards
{

    BOOL differ = YES;
    SetCard* leadCard = (SetCard*) [cards objectAtIndex:0];
    int leadPattern = [leadCard pattern];
    int currentIndex = 1;
    while (currentIndex < [cards count] && differ == YES)
    {
        SetCard* currentCard = [cards objectAtIndex:currentIndex];
        if ([currentCard pattern] == leadPattern)
        {
            differ = NO;
        MatchingLogMessage* message = [[MatchingLogMessage alloc]initWithCards:cards operation:@"Check if the pattern of symbols differ in all cards." result:@"No, the patterns of symbols don't differ in all cards"];
            [self addToLogger:message];
        }
        currentIndex++;
    }
    return differ;
}

- (BOOL)checkIfCardsMatchInColor:(NSArray*) cards
{

    BOOL match = YES;
   
    SetCard* leadCard = (SetCard*) [cards objectAtIndex:0];
   
    int leadColor = [leadCard color];
    int currentIndex = 1;
    
    
    while (currentIndex < [cards count] && match == YES)
    {
        
        SetCard* currentCard = [cards objectAtIndex:currentIndex];
        if ([currentCard color] != leadColor)
        {
            match = NO;
            MatchingLogMessage* message = [[MatchingLogMessage alloc]initWithCards:cards operation:@"Check if color matches in all cards." result:@"No, the color doesn't match in all cards"];
            [self addToLogger:message];
            
        }
        currentIndex++;
       
    }
    
    return match;
}

- (BOOL)checkIfCardsDifferInColor:(NSArray*) cards
{
    BOOL differ = YES;
    SetCard* leadCard = (SetCard*) [cards objectAtIndex:0];
    int leadColor = [leadCard color];
    int currentIndex = 1;
    while (currentIndex < [cards count] && differ == YES)
    {
        SetCard* currentCard = [cards objectAtIndex:currentIndex];
        if ([currentCard color] == leadColor)
        {
            differ = NO;
                 MatchingLogMessage* message = [[MatchingLogMessage alloc]initWithCards:cards operation:@"Check if the color of symbols differ in all cards." result:@"No, the color of symbols doesn't differ in all cards"];
            [self addToLogger:message];
        }
        currentIndex++;
    }
    return differ;
}

- (void) resetLogger
{
    [self setLogger:nil];
}

- (int)match:(NSArray *)otherCards
{
    [self resetLogger]; // to make sure that only to the current matching a log file exists (sounds like yoda..)
    int score = 0;
    NSMutableArray* allCards = [[NSMutableArray alloc]initWithArray:otherCards];
    [allCards addObject:self];
    if ([self checkIfSymbolMatchesInCards:allCards] || [self checkIfCardsDifferInSymbol:allCards])
    {
        if ([self checkIfCardsMatchInNumberOfSymbols:allCards] || [self checkIfCardsDifferInNumberOfSymbols:allCards])
        {
            
            if ([self checkIfCardsMatchInPattern:allCards] || [self checkIfCardsDifferInPattern:allCards])
            {
                if([self checkIfCardsMatchInColor:allCards] || [self checkIfCardsDifferInColor:allCards])
                {
                    score = 1;
                    MatchingLogMessage* message = [[MatchingLogMessage alloc]initWithCards:allCards operation:@"Comparison completed." result:@"A perfect match!"];
                    [self addToLogger:message];
                }
                
            }
        }
        else
        {
        
        }
    }
    
    return score;
    
}


- (NSString*) description
{
    return [NSString stringWithFormat:@"Symbol:%d\r NumberOfSymbols:%d\r Pattern:%d\r Color:%d\r", [self symbol], [self numberOfSymbols], [self pattern], [self color]];
}
@end
