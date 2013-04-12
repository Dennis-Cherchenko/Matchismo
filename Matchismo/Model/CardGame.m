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
            [cards addObject:[deck drawCard]];
        }
    
        _cards = cards;
        _score = 0;
    }
    
    return self;
}

- (void)flipCardAtIndex:(NSUInteger)index{
    
    _score -= 1;
    
    PlayingCard *theCard = self.cards[index];
    theCard.flipped = !theCard.flipped;
    
    NSMutableArray *faceUpCards = [[NSMutableArray alloc] init];
    
    for(PlayingCard *aCard in self.cards){
        if(aCard.flipped){
            [faceUpCards addObject:aCard];
        }
    }
    
    
    if([faceUpCards count] == 2){

        PlayingCard *upCard0 = faceUpCards[0];
        PlayingCard *upCard1 = faceUpCards[1];
        
        int matchValue = [upCard0 matches:upCard1];
        
        if(matchValue){
            _score += matchValue;
            upCard0.playable = upCard1.playable = NO;
            upCard0.flipped = upCard1.flipped = NO;
        }
    }else if ([faceUpCards count] == 3) {
        
        for(PlayingCard *aCard in self.cards){
            aCard.flipped = NO;
        }
        
        theCard.flipped = YES;
    }
}

@end


