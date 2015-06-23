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


@interface SetGameViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *setCardButtons;


@end

@implementation SetGameViewController
@synthesize setCardButtons;

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

- (void)viewDidLoad {

    SetCardDeck* deck = [[SetCardDeck alloc]init];
    int index = 0;
    NSArray* setCards = [deck cards];
    for (UIButton* currentButton in [self setCardButtons]) {
        [currentButton setAttributedTitle:[SetGameViewController prepareForDisplayCard:(SetCard*)[setCards objectAtIndex:index]] forState:UIControlStateNormal];
        index++;
    }

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
if ([[segue identifier]isEqualToString:@"segueTohistoryView"])
{

if ([[segue destinationViewController]isKindOfClass:[HistoryViewController class]])
{
    HistoryViewController* targetVC = (HistoryViewController*)[segue destinationViewController];
    [targetVC setLogMessages:<#(NSArray *)#>]
}
}

}


                                                    



@end
