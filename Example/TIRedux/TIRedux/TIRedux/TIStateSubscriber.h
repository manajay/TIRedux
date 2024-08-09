//
//  TIStateSubscriber.h
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TIState;

@protocol TIStateSubscriber <NSObject>

@required
- (void)didChangedState:(__kindof TIState *)newState oldState:(__kindof TIState *)oldState;

@end

NS_ASSUME_NONNULL_END
