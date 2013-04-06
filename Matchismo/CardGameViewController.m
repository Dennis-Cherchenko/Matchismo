//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Dennis on 3/20/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) PlayingCardDeck *deck;
@property (strong, nonatomic) CardGame *cardGame;
@end

@implementation CardGameViewController

- (PlayingCardDeck *)deck {
    if(!_deck){
        _deck = [[PlayingCardDeck alloc] init ];
    }
    return _deck;
}

- (PlayingCardDeck *)cardGame {
    if(!_cardGame){
        _cardGame = [[CardGame alloc] initWithCardCount:[self.cardButtons count]];
    }
    return _cardGame;
}

- (void) updateView{
// reset view and redraw cards

}


- (void)setCardButtons:(NSArray *)cardButtons{
        _cardButtons = cardButtons;
    for(int i = 0; i < [cardButtons count]; i++){

        
        [[cardButtons objectAtIndex:i] setTitle:[[self.deck drawCard] contents] 
                                       forState: UIControlStateSelected];
        
    }
}

- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat: @"Flips: %d", self.flipCount]; 
}


- (IBAction)flipCard:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    self.flipCount ++;
}


@end
