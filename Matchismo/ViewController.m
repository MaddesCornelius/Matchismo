//
//  ViewController.m
//  Matchismo
//
//  Created by Privat on 26.01.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "ViewController.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic)CardMatchingGame* game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (nonatomic) int numberOfPossibleMatch;
- (IBAction)GameModeSwitch:(UISwitch *)sender;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
- (IBAction)redealButtonTouched:(id)sender;
@end

@implementation ViewController
@synthesize game = _game;
@synthesize numberOfPossibleMatch = _numberOfPossibleMatch;

//Standard number of matches is 2
-(int)numberOfPossibleMatch
{
if (!_numberOfPossibleMatch)
{
    _numberOfPossibleMatch = 2;
}
    return _numberOfPossibleMatch;
}

- (IBAction)GameModeSwitch:(UISwitch *)sender {
if ([sender isOn])
    {
        [self setNumberOfPossibleMatch:(3)];
    }
else
{
    [self setNumberOfPossibleMatch:(2)];
}
    [self setGame:(nil)];
    [self updateUI];
}

- (CardMatchingGame*)game
{
    if (!_game) {
        
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                   PossibleNumberOfMatches:[self numberOfPossibleMatch]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck*)createDeck
{
    return [[PlayingCardDeck alloc]init];
}
- (IBAction)touchCardButton:(UIButton *)sender {
    
    int choosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:choosenButtonIndex];
    [self updateUI];
    
    
}

-(void)updateUI
{
    for (UIButton *currentButton in self.cardButtons)
    {
        int currentButtonIndex = [self.cardButtons indexOfObject:currentButton];
        Card* currentCard = [self.game cardAtIndex:currentButtonIndex];
        [currentButton setTitle:[self titleForCard:(currentCard)] forState:UIControlStateNormal];
        [currentButton setBackgroundImage:[self backgoundImageforCard:currentCard]forState:UIControlStateNormal];
        currentButton.enabled = !currentCard.isMatched;
        self.scoreLable.text =[ NSString stringWithFormat:@"Score: %d",[self.game score]];
    }
}
         
- (NSString* ) titleForCard:(Card*) card
         {
             return card.isChosen ? card.contents : @"";
         }

- (UIImage *)backgoundImageforCard:(Card*) card
         {
             return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
         }





- (IBAction)redealButtonTouched:(id)sender {
    [self setGame:(nil)];
    [self updateUI];
}
@end
