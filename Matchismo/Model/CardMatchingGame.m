//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Privat on 06.02.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic,readwrite)NSInteger score;
@property (nonatomic, strong) NSMutableArray* cards; //of Card
@property (nonatomic) NSInteger possibleNumberOfMatches;
@property (nonatomic, strong)NSMutableArray* choosenCardMemory;
@property (nonatomic, strong)NSString* gameLog;
@end

@implementation CardMatchingGame
@synthesize choosenCardMemory = _choosenCardMemory;
@synthesize possibleNumberOfMatches = _possibleNumberOfMatches;
@synthesize gameLog = _gameLog;

-(NSMutableArray *)choosenCardMemory
{
    if (!_choosenCardMemory)
    {
        _choosenCardMemory = [[NSMutableArray alloc]init];
    }
    return _choosenCardMemory;
}
- (instancetype) initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self)
    {
        for(int i=0;i<count;i++)
     {
         Card* newDrawnCard =[deck drawRandomCard];
         if (newDrawnCard)
         {
         [self.cards addObject:(newDrawnCard)];
         }
         else
         {
             self = nil;
             break;
         }
         
         }
    }
    
    return self;
}

- (instancetype) initWithCardCount:(NSInteger)count PossibleNumberOfMatches:(int) numberOfMatches usingDeck:(Deck *)deck
{
    self = [super init];
    if (self)
    {
        for(int i=0;i<count;i++)
        {
            Card* newDrawnCard =[deck drawRandomCard];
            if (newDrawnCard)
            {
                [self.cards addObject:(newDrawnCard)];
            }
            else
            {
                self = nil;
                break;
            }
            
        }
        [self setPossibleNumberOfMatches:(numberOfMatches)];
    }
    
    return self;
}

- (NSMutableArray*) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

@synthesize score = _score;

static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOSE = 1;


//- (void)chooseCardAtIndex:(NSInteger)index
//{
//    Card* selectedCard = [self cardAtIndex:(index)];
//    if (!selectedCard.isMatched)
//    {
//        if (selectedCard.isChosen)
//        {
//            selectedCard.chosen = NO;
//        }
//        else
//        {
//        
//            
//            for (Card* otherCard in self.cards)
//            {
//                if (otherCard.isChosen && !otherCard.isMatched)
//                {
//                    int matchScore = [selectedCard match:@[otherCard]];
//                    if (matchScore)
//                    {
//                        self.score += matchScore * MATCH_BONUS;
//                        selectedCard.matched = YES;
//                        otherCard.matched = YES;
//                    }
//                    else
//                    {
//                        self.score -= MISMATCH_PENALTY;
//                        otherCard.chosen = NO;
//                    }
//                    break;
//                    
//                    
//                }
//            }
//            self.score -= COST_TO_CHOSE;
//            selectedCard.chosen = YES;
//        }
//    }
//    
//    
//}

- (void)chooseCardAtIndex:(NSInteger)index
{
    Card* selectedCard = [self cardAtIndex:(index)];
    
    
    
    if (!selectedCard.isMatched)
    {
        
        if (selectedCard.isChosen)
        {
            selectedCard.chosen = NO;
            [self FromChoosenCardsMemoryRemoveCard:(selectedCard)];
            [self setGameLog:(@"Unselect.")];
            
        }
        else
        {
            
            if ([self.choosenCardMemory count] == (self.possibleNumberOfMatches -1))
            {
                int matchScore = [selectedCard match:[self choosenCardMemory]];
                
                //Needs to be added here to the array of chosen cards since the matching method  assumes that self is not part of the array to be matched against. However, every following operation concerns every card, which includes the most resently choosen. I know this logic is bullocks, in a better version match would filter self first and exclude it, if requested (by paramater).
                [self.choosenCardMemory addObject:selectedCard];
                
                if (matchScore)
                {
                    self.score += matchScore * MATCH_BONUS;
                    [self setAllCardsInChoosenCardsMemoryToMatched];
                }
                else
                {
                    self.score -= MISMATCH_PENALTY;
                    [self unmatchCardsInChoosenCardsMemory];
                    [self setAllCardsInChoosenCardsMemoryToNotChoosen];
                    //The last card picked shall stay visible
                    selectedCard.Chosen = YES;
                   
                }
                [self emptyChoosenCardsMemory];
            }
            
            self.score -= COST_TO_CHOSE;
            if (!selectedCard.isMatched)
            {
            [self addToChoosenCardsMemory:selectedCard];
            }
            selectedCard.chosen = YES;
            
            
        }
    }
    
    
}
- (void) setAllCardsInChoosenCardsMemoryToNotChoosen
{
    for (Card* currentCard in [self choosenCardMemory]) {
        [currentCard setChosen:NO];
    }
}
- (void) FromChoosenCardsMemoryRemoveCard:(Card*)selectedCard
{
    for (Card* currentCard in [self choosenCardMemory]) {
        if ([currentCard isEqual:selectedCard])
        {
            [[self choosenCardMemory] removeObject:currentCard];
        }
    }
}
- (void) setAllCardsInChoosenCardsMemoryToMatched
{
    for (Card* currentCard in [self choosenCardMemory]) {
        currentCard.matched = YES;
    }
    
    
}


- (void) unmatchCardsInChoosenCardsMemory
{
    for (Card* currentCard in [self choosenCardMemory])
    {
        currentCard.matched = NO;
    }
}


- (void) addToChoosenCardsMemory:(Card* )choosenCard
{
    [self.choosenCardMemory addObject:choosenCard];
}
- (void) emptyChoosenCardsMemory {
    [self setChoosenCardMemory:nil];
}

- (Card*)cardAtIndex:(NSInteger)index
{
    if (index < [self.cards count])
    {
     return self.cards [index];
    }
    else
    {
        return nil;
    }
}

@end
