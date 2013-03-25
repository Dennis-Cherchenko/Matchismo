//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Dennis on 3/20/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController


- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat: @"Flips: %d", self.flipCount]; 
}


- (IBAction)flipCard:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    self.flipCount ++;
}


@end
