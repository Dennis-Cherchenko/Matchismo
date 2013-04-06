//
//  PlayingCard.h
//  Matchismo
//
//  Created by Dennis on 3/20/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayingCard : NSObject

@property(strong, nonatomic) NSString* suit;
@property(strong, nonatomic) NSString* rank;
- (NSString *) contents;
+ (NSArray *) ranks;
+ (NSArray *) suits;
@property(nonatomic) BOOL flipped; // whether or not face up
@property(nonatomic) BOOL playable; // if matched, disable
- (NSUInteger) matches : (PlayingCard *) otherCard; //return 0 if not mactch, returns 4 if the same suit, return 13 is the same rank
@end
