//
//  HistoryViewController.m
//  Matchismo
//
//  Created by Privat on 07/06/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "HistoryViewController.h"
#import "LogMessage.h"
#import "MatchingLogMessage.h"
#import "SetCardToolbox.h"
#import "SetCard.h"
#import "CardMatchingGame.h"
#import "SetCardDeck.h"
@interface HistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *historyTextView;
@property (strong, nonatomic)CardMatchingGame* game;


@end

@implementation HistoryViewController
@synthesize logMessages = _logMessages;

-(instancetype)initWithMatchingHistory:(NSArray *)matchingLog
{
    self = [super init];
  
    if (self) {
        //Casting logs, e.g. matchingLogs from setCard-Game contain
        // setCard-Objects which need to be casted to be displayed
        _logMessages = [SetCardToolbox castLogMessages:matchingLog];
        [self addMessagesToHistoryView:[self logMessages]];
    }
   
   
  
    return self;

}




- (void)viewDidLoad {
    [super viewDidLoad];
[self addFakeSetCards];
    
  
    // Do any additional setup after loading the view.
}
- (void) addFakeSetCards
{
    
    SetCard* firstCard = [[SetCard alloc]init];
    SetCard* secondCard = [[SetCard alloc]init];
    SetCard* thirdCard = [[SetCard alloc]init];
    
    [firstCard setSymbol:1];
    [firstCard setNumberOfSymbols:3];
    [firstCard setPattern:1];
    [firstCard setColor:1];
    
    [secondCard setSymbol:1];
    [secondCard setNumberOfSymbols:3];
    [secondCard setPattern:1];
    [secondCard setColor:2];
    
    
    [thirdCard setSymbol:1];
    [thirdCard setNumberOfSymbols:3];
    [thirdCard setPattern:1];
    [thirdCard setColor:3];
    [firstCard match:@[secondCard, thirdCard]];
    [self setLogMessages:[SetCardToolbox castLogMessages:[firstCard.logger logMessages]]];
   
    [self addMessagesToHistoryView:[self logMessages]];
    

}
- (void)addMessagesToHistoryView:(NSArray*) messages
{
    for (NSAttributedString* currentMessage in messages) {
        NSAttributedString* currentContent = [self.historyTextView attributedText];
        NSMutableAttributedString* newContent = [[NSMutableAttributedString alloc]initWithAttributedString:currentContent];
        [newContent appendAttributedString:currentMessage];
        [self.historyTextView setAttributedText:newContent];
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
