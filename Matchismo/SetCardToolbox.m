//
//  SetCardToolbox.m
//  Matchismo
//
//  Created by Privat on 07/06/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "SetCardToolbox.h"
#import "SetCard.h"
#import <UIKit/UIKit.h>

@implementation SetCardToolbox
+ (NSAttributedString*)prepareForDisplayCard:(SetCard*) setCard
{
    NSString* stringContent = [SetCardToolbox stringValueForSymbol:[setCard symbol] andNumberOfSymbols:[setCard numberOfSymbols]];
    NSDictionary* attributes = [SetCardToolbox attributesForPattern:[setCard pattern] andColor:[setCard color]];
    NSMutableAttributedString* displayAttrString =
    [[NSMutableAttributedString alloc]initWithString:stringContent attributes:attributes];
    
    
    return displayAttrString ;
}

+ (NSString*) stringValueForSymbol:(int)symbolId andNumberOfSymbols:(int)numberOfSymbols
{
    NSMutableString* contentString = [[NSMutableString alloc]initWithString:@""];
    for (int i = 1; i <= numberOfSymbols; i++)
    {
        [contentString setString:[contentString stringByAppendingString:[SetCardToolbox stringMatchingSymbolId:symbolId]]];
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
    
    
    [dic setValue:[SetCardToolbox strokeWidthValueForPatternId:patternId] forKey:NSStrokeWidthAttributeName];
    
    [dic setValue:[SetCardToolbox colorValueForColorId:colorId] forKey:NSForegroundColorAttributeName];
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
+ (NSAttributedString*) castMatchingLogMessage:(MatchingLogMessage*)message
{
    NSMutableAttributedString* castedMessage = [[NSMutableAttributedString alloc]initWithString:[[message operation]stringByAppendingString:@"\n Cards:"]];
    
    for (SetCard* currentCard in [message objects]) {
       NSAttributedString* castedCard = [SetCardToolbox prepareForDisplayCard:currentCard];
        [castedMessage appendAttributedString:castedCard];
        NSAttributedString* breakline = [[NSAttributedString alloc]initWithString:@"\n"];
        [castedMessage appendAttributedString:breakline];
    }
    NSAttributedString* attributedResult = [[NSAttributedString alloc]initWithString:[@"Result: " stringByAppendingString:[message result]]];
    [castedMessage appendAttributedString:attributedResult];
    
    
    return castedMessage;

}

+ (NSArray*) castLogMessages:(NSArray*)log
{
    NSMutableArray* castedLog = [[NSMutableArray alloc]init];
    for (id currentMessage in log) {
        if ([currentMessage isKindOfClass:[MatchingLogMessage class]])
        {
            NSAttributedString* temp = [SetCardToolbox castMatchingLogMessage:currentMessage];
            [castedLog addObject:temp];
        }
    }
    return castedLog;
}

@end
