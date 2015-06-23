//
//  SetCardToolbox.h
//  Matchismo
//
//  Created by Privat on 07/06/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCard.h"
#import "MatchingLogMessage.h"

@interface SetCardToolbox : NSObject
+ (NSAttributedString*)prepareForDisplayCard:(SetCard*)setCard;
+ (NSString*) stringValueForSymbol:(int)symbolId andNumberOfSymbols:(int)numberOfSymbols;
+ (NSString*) stringMatchingSymbolId:(int)symbolId;
+ (NSDictionary*) attributesForPattern:(int)patternId andColor:(int)colorId;
+ (id<NSCopying>) strokeWidthValueForPatternId:(int)patternId;
+ (id<NSCopying>) colorValueForColorId:(int)colorId;
+ (NSAttributedString*) castMatchingLogMessage:(MatchingLogMessage*)message;
+ (NSArray*) castLogMessages:(NSArray*)log;






@end
