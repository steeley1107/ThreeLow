//
//  GameController.m
//  Threelow
//
//  Created by Steele on 2015-10-21.
//  Copyright © 2015 Steele. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.keptDice = [[NSMutableArray alloc] initWithCapacity:5];
        self.allDice = [[NSMutableArray alloc] initWithCapacity:5];
        Dice *diceOne = [[Dice alloc] init];
        Dice *diceTwo = [[Dice alloc] init];
        Dice *diceThree = [[Dice alloc] init];
        Dice *diceFour = [[Dice alloc] init];
        Dice *diceFive = [[Dice alloc] init];
        [_allDice addObject:diceOne];
        [_allDice addObject:diceTwo];
        [_allDice addObject:diceThree];
        [_allDice addObject:diceFour];
        [_allDice addObject:diceFive];

    }
    return self;
}

-(int)displayScore {
    int score = 0;
    for (Dice *dice in _keptDice) {
        score = score + dice.currentValue.intValue;
    }
    return score;
}


-(bool)allowRoll {
    if (_firstRoll){
        _firstRoll = false;
        return true;
    }
    if (_currentHolds  > _pastHolds) {
        return true;
    }else {
      return false;
    }
    return true;
}



@end
