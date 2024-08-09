//
//  TICustomReducer.m
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import "TICustomReducer.h"
#import "TIMiddleClickCountIncrementDispatchAction.h"
#import "TICustomState.h"

@implementation TICustomReducer

- (__kindof TIState *)dispatch:(TIDispatchAction *)action state:(__kindof TIState *)state {
    if (![state isKindOfClass:[TICustomState class]]) {
        return state;
    }
    if ([action isKindOfClass:[TIMiddleClickCountIncrementDispatchAction class]]) {
//        TIMiddleClickCountIncrementDispatchAction *incrementAction = (TIMiddleClickCountIncrementDispatchAction *)action;
        TICustomState *newState = [state generateNewState];
        newState.middleCount ++;
        return newState;
    }
    return state;
}

@end
