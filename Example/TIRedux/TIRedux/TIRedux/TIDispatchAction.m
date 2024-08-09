//
//  TIDispatchAction.m
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import "TIDispatchAction.h"

@implementation TIDispatchAction

- (TIDispatchActionType)type {
    return NSStringFromClass([self class]);
}

@end
