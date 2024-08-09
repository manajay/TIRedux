//
//  TIState.m
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import "TIState.h"

@implementation TIState

- (id)copyWithZone:(NSZone *)zone {
    Class class = [self class];
    TIState *newState = [[class alloc] init];
    //子类 mj 赋值 或者自己实现
    return newState;
}

- (__kindof TIState *)generateNewState {
    TIState *newState = [self copy];
    return newState;
}

@end
