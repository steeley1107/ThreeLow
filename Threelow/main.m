//
//  main.m
//  Threelow
//
//  Created by Steele on 2015-10-21.
//  Copyright © 2015 Steele. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Dice.h"
#import "GameController.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        InputCollector *consoleInput = [[InputCollector alloc] init];
        NSString *inputData;
        
        GameController *game1 = [[GameController alloc] init];
        
        game1.firstRoll = true;
        game1.pastHolds = 0;
        
        
        while (![inputData isEqualToString:@"quit"]) {
            
            NSLog(@"Threeroll\n");
            game1.currentHolds = [game1.keptDice count];

            inputData = [consoleInput inputForPrompt:@"roll or hold:"];
            
            //roll the dice
            if ([inputData isEqualToString:@"roll"]) {
                
                if (game1.allowRoll) {
                
                 [game1.diceOne random];
                    
                    if (![game1.keptDice containsObject: [game1.allDice objectAtIndex:0]]) {
                        [[game1.allDice objectAtIndex:0] random];
                    }
                    if (![game1.keptDice containsObject: [game1.allDice objectAtIndex:1]]) {
                        [[game1.allDice objectAtIndex:1] random];
                    }
                    if (![game1.keptDice containsObject: [game1.allDice objectAtIndex:2]]) {
                        [[game1.allDice objectAtIndex:2] random];
                    }
                    if (![game1.keptDice containsObject: [game1.allDice objectAtIndex:3]]) {
                        [[game1.allDice objectAtIndex:3] random];
                    }
                    if (![game1.keptDice containsObject: [game1.allDice objectAtIndex:4]]) {
                        [[game1.allDice objectAtIndex:4] random];
                    }
                    
                }
                else {
                    NSLog(@"hold is required");
               }
            
        }
        
        //hold and relese dice
        else if ([inputData isEqualToString:@"hold"]) {
            
            //NSMutableSet *diceSet = [[NSMutableSet alloc] init];
            
            //Get dice selection from user.
            inputData = [consoleInput inputForPrompt:@"Pick a dice to hold:"];
            int diceNumberToHold = [inputData intValue];
            
            if (diceNumberToHold < [game1.allDice count]) {
                
                if (![game1.keptDice containsObject:game1.allDice[diceNumberToHold]]) {
                    [game1.keptDice addObject:game1.allDice[diceNumberToHold]];
                }
                else {
                    [game1.keptDice removeObjectIdenticalTo:game1.allDice[diceNumberToHold]];
                }
                
                
            }
            game1.pastHolds = game1.currentHolds;
        }
        
        //Reset the all held dice.
        else if ([inputData isEqualToString:@"reset"]) {
            [game1.keptDice removeAllObjects];
        }
        
        
        
        //Display the dice.
        for (Dice *dice in game1.allDice) {
            if  ([game1.keptDice containsObject: dice]) {
                NSLog(@"[%@]",dice.currentValue);
            }
            else {
                NSLog(@"%@",dice.currentValue);
            }
        }
        NSLog(@"Your Current Score is %d",[game1 displayScore]);
        
        
    }
    
    
}
return 0;
}
