//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Dennis on 3/20/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "PlayingCardDeck.h"
@interface PlayingCardDeck()
@property(strong, nonatomic) NSMutableArray* cards;
@end


@implementation PlayingCardDeck

- (NSMutableArray *)cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
        for(NSString *rank in [PlayingCard ranks]){
            for(NSString *suit in [PlayingCard suits]){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [_cards addObject: card];

            }
        }
    }
    
    return _cards;
}



- (PlayingCard *)drawCard{
    
    if(![self.cards count]){
        return nil;
    }
    
    int index = arc4random() % [self.cards count];
    
    PlayingCard* ret = self.cards[index];
    
    [self.cards removeObjectAtIndex:index];
    
    return ret;
}



@end
