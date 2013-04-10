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
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardGame *cardGame;
@end

@implementation CardGameViewController

- (CardGame *)cardGame {
    if(!_cardGame){
        _cardGame = [[CardGame alloc] initWithCardCount:[self.cardButtons count]];
    }
    return _cardGame;
}

- (void) updateView{
// reset view and redraw cards
    for(int i = 0; i < [self.cardButtons count]; i++){
        UIButton *button = [self.cardButtons objectAtIndex:i];
        PlayingCard *card = [self.cardGame.cards objectAtIndex:i];
        button.selected = card.flipped;
        button.enabled = card.playable;
        [button setTitle:[card contents] forState: UIControlStateSelected];
        [button setTitle:[card contents] forState: UIControlStateDisabled];
        [button setAlpha:card.playable ? 1 : 0.5];
    }
    self.scoreLabel.text = [NSString stringWithFormat: @"Score: %d", self.cardGame.score];
}

- (void)setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    [self updateView];
}

- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat: @"Flips: %d", self.flipCount];
    
}


- (IBAction)flipCard:(UIButton *)sender {
    
    [self.cardGame flipCardAtIndex: [self.cardButtons indexOfObject:sender]];
    [self updateView];
    self.flipCount++;
}


@end
