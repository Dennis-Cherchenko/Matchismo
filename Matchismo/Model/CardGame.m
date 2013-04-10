//
//  CardGame.m
//  Matchismo
//
//  Created by Dennis on 4/6/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "CardGame.h"
#import "PlayingCardDeck.h"

@implementation CardGame

- (id)initWithCardCount:(NSUInteger)count{
    self = [super init];
    
    if(self){
        PlayingCardDeck *deck = [[PlayingCardDeck alloc] init];
        NSMutableArray *cards = [[NSMutableArray alloc] init];
    
        for(int i = 0; i < count; i++){
            [cards addObject: [deck drawCard]];
        }
    
        _cards = cards;
        _score = 0;
    }
    
    return self;
}

- (void)flipCardAtIndex:(NSUInteger)index{
    
    PlayingCard *theCard = self.cards[index];
    _score -= 1;
    for(PlayingCard *aCard in self.cards){
        if(aCard.flipped && aCard != theCard){
            aCard.flipped = NO;
            int matchValue = [theCard matches:aCard];
            if(matchValue){
                _score += matchValue;
                theCard.playable = aCard.playable = NO;
                return;
            }
            
        }
    }
    
    theCard.flipped = !theCard.flipped;
    

}

@end


