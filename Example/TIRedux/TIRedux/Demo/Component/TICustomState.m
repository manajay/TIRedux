//
//  TICustomState.m
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import "TICustomState.h"

@implementation TICustomState

- (id)copyWithZone:(NSZone *)zone {
    TICustomState *newState = [super copyWithZone:zone];
    newState.middleCount = self.middleCount;
    return newState;
}

@end
