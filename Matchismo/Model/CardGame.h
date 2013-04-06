//
//  CardGame.h
//  Matchismo
//
//  Created by Dennis on 4/6/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardGame : NSObject
- (id)initWithCardCount: (NSUInteger) count;
@property(strong, nonatomic, readonly) NSArray *cards;
@property(nonatomic, readonly) NSUInteger score;
- (void) flipCardAtIndex: (NSUInteger) index;
@end
