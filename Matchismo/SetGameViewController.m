//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Privat on 18.04.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetCardDeck.h"
#import "SetCard.h"
#import "HistoryViewController.h"
#import "CardMatchingGame.h"
#import "SetGameViewController.h"
#import "TestSetGameViewController.h"


@interface SetGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *setCardButtons;
@property (strong, nonatomic)CardMatchingGame* game;
- (IBAction)touchCardButton:(UIButton *)sender;

@end

@implementation SetGameViewController
@synthesize setCardButtons;
@synthesize game = _game;
- (CardMatchingGame*) game
{
    if (!_game)
    {

    _game = [[CardMatchingGame alloc] initWithCardCount:[self.setCardButtons count]
                                PossibleNumberOfMatches:3
                                              usingDeck:[self createDeck]];
}
return _game;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger indexOfButton = [self getIndexOfButton:sender];
    
}

- (NSUInteger) getIndexOfButton:(UIButton*)sender
{

    NSUInteger index = [self.setCardButtons indexOfObject:sender];
    return index;
}

- (Deck*)createDeck
{
    return [[SetCardDeck alloc]init];
}

- (void)viewDidLoad {
    
    //For testing purposes - BEGIN
    NSUInteger numberOfCards = [self.setCardButtons count];
    _game = [TestSetGameViewController demoCardMatchingGame:numberOfCards]; //For testing purposes
    //For testing purposes - END
    
    [self initUI];
    [self updateUI];
    
}


+ (NSAttributedString*)prepareForDisplayCard:(SetCard*) setCard
{
    NSString* stringContent = [SetGameViewController stringValueForSymbol:[setCard symbol] andNumberOfSymbols:[setCard numberOfSymbols]];
    NSDictionary* attributes = [SetGameViewController attributesForPattern:[setCard pattern] andColor:[setCard color]];
    NSMutableAttributedString* displayAttrString =
    [[NSMutableAttributedString alloc]initWithString:stringContent attributes:attributes];
    
    
    return displayAttrString ;
}

+ (NSString*) stringValueForSymbol:(int)symbolId andNumberOfSymbols:(int)numberOfSymbols
{
    NSMutableString* contentString = [[NSMutableString alloc]initWithString:@""];
    for (int i = 1; i <= numberOfSymbols; i++)
    {
        [contentString setString:[contentString stringByAppendingString:[SetGameViewController stringMatchingSymbolId:symbolId]]];
    }
    return contentString;
}


-(void)initUI
{
    /* Walks through the Buttons on the ViewController and matches them with the
    cards in the game. This operation contains a complex transformation from the from the model representation of the card in the model to a front end usable version.
   */
    
    
    int index = 0;
    for (UIButton* currentButton in [self setCardButtons]) {
        [currentButton setAttributedTitle:[SetGameViewController prepareForDisplayCard:(SetCard*)[self.game cardAtIndex:index]] forState:UIControlStateNormal];
        index++;
    }

}

-(void)updateUI
//Walks through the Buttons on the ViewController and matches them with the
// cards in the game. Matching means that if a card was part of an earlier correct set-match, then the button symbolizing the card will be disabled.
{

    int index = 0;
    NSMutableArray* mutableSetCardButtons = [self.setCardButtons mutableCopy];
    while (index <mutableSetCardButtons.count)
    {
    UIButton* currentButton = [mutableSetCardButtons objectAtIndex:index];
        if ([currentButton isEnabled] )
        {
     if ([[self.game cardAtIndex:index]isMatched])
     {
         
         [currentButton setEnabled:false];
         [mutableSetCardButtons replaceObjectAtIndex:index withObject:currentButton];
     }
        }
        index=index+1;
    }
    [self setSetCardButtons:mutableSetCardButtons];
  
}
         
+ (NSString*) stringMatchingSymbolId:(int)symbolId
         {
             NSString* symbol = @"";
             switch (symbolId) {
                 case 1:
                    symbol = [symbol stringByAppendingString:@"▲"];
                     break;
                case 2:
                     symbol = [symbol stringByAppendingString:@"●"];
                     break;
                case 3:
                     symbol = [symbol stringByAppendingString:@"■"];
                     break;
                     
                 default:
                     break;
             }
             
             return  symbol;
         }
+ (NSDictionary*) attributesForPattern:(int)patternId andColor:(int)colorId
    {
        NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    
        
        [dic setValue:[SetGameViewController strokeWidthValueForPatternId:patternId] forKey:NSStrokeWidthAttributeName];
        
        [dic setValue:[SetGameViewController colorValueForColorId:colorId] forKey:NSForegroundColorAttributeName];
        return dic;
    }
+ (id<NSCopying>) strokeWidthValueForPatternId:(int)patternId
{
    switch (patternId) {
        case 1:
            return @5;
            break;
        case 2:
            return @10;
            break;
        case 3:
            return @20;
            break;
        default:
            return @0;
            break;
    }
}

+ (id<NSCopying>) colorValueForColorId:(int)colorId
{
    
    switch (colorId) {
        case 1:
            return [UIColor greenColor];
            break;
        case 2:
            return [UIColor yellowColor];
            break;
        case 3:
            return [UIColor redColor];
            break;
        default:
            return [UIColor blackColor];
            break;
    }
   
}



- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
if ([[segue identifier]isEqualToString:@"segueTohistoryView"])
{

if ([[segue destinationViewController]isKindOfClass:[HistoryViewController class]])
{
    HistoryViewController* targetVC = (HistoryViewController*)[segue destinationViewController];
    //[targetVC setLogMessages:<#(NSArray *)#>]
}
}

}


                                                    



@end
