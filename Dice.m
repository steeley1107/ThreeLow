//
//  Dice.m
//  Threelow
//
//  Created by Steele on 2015-10-21.
//  Copyright © 2015 Steele. All rights reserved.
//

#import "Dice.h"

@implementation Dice


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self random];
    }
    return self;
}

- (void)random {
    int randomValue = arc4random()%6+1;
    _currentValue = [NSNumber numberWithInt:randomValue];
    
}




@end
