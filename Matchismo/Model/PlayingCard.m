//
//  PlayingCard.m
//  Matchismo
//
//  Created by Dennis on 3/20/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
- (id)init{
    self = [super init];
    if(self){
        self.playable = YES;
        self.flipped = NO;
    }
    
    return self;
}

- (NSString *)contents{
    return [self.rank stringByAppendingString:self.suit];
    
}

- (NSUInteger)matches:(PlayingCard *)otherCard{
    if([self.rank isEqualToString:otherCard.rank]){
        return 13;
    }else if([self.suit isEqualToString:otherCard.suit]){
        return 0;
    }else{
        return 0;
    }
}


+ (NSArray *)ranks{
    return @[@"A", @"2", @"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}


- (void)setRank:(NSString *)rank{
    if([[PlayingCard ranks] containsObject: rank]){
        _rank = rank;
    }
}


+ (NSArray *)suits{
    return @[@"♠", @"♣", @"♥",@"♦"];
    
}

- (void)setSuit:(NSString *)suit{
    if([[PlayingCard suits] containsObject: suit]){
        _suit = suit;
    }
}





@end
