//
//  GameController.h
//  Threelow
//
//  Created by Steele on 2015-10-21.
//  Copyright © 2015 Steele. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dice.h"

@interface GameController : NSObject

@property (nonatomic, strong) NSMutableArray *keptDice;
@property (nonatomic, strong) NSMutableArray *allDice;

@property (nonatomic, assign) bool firstRoll;
@property (nonatomic, assign) long currentHolds;
@property (nonatomic, assign) long pastHolds;

@property (nonatomic, strong)Dice *diceOne;
@property (nonatomic, strong)Dice *diceTwo;
@property (nonatomic, strong)Dice *diceThree;
@property (nonatomic, strong)Dice *diceFour;
@property (nonatomic, strong)Dice *diceFive;




-(int)displayScore;

-(bool)allowRoll;

@end
