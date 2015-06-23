//
//  HistoryViewController.h
//  Matchismo
//
//  Created by Privat on 07/06/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "ViewController.h"

@interface HistoryViewController : UIViewController
- (instancetype)initWithMatchingHistory:(NSArray*)matchingLog;
@property (strong)NSArray* logMessages;
@end
