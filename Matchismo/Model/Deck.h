//
//  Deck.h
//  Matchismo
//
//  Created by Privat on 30.01.15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card*)aCard atTop:(BOOL)atTop;
-(Card*)drawRandomCard;


@end
