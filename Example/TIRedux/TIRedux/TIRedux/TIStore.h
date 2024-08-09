//
//  TIStore.h
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TIState, TIDispatchAction;
@protocol TIStateSubscriber, TIReducer;

/// 单个 Store 的问题， 全量 State 生成， 通知全部订阅者， 即便 sub component 关注的不是自己的数据，也会订阅到， 需要自己去diff ， 万一没有处理， 即便自己的数据没有变化， 也会被动刷新
/// 提供 getState 读取状态， changeState 更新状态， subscriber 通知订阅者状态更新回调 的 3 种能力
@interface TIStore : NSObject

- (instancetype)initWithInitState:(__kindof TIState *)initState dispatcher:(id<TIReducer>)dispatcher;

- (void)susbcribe:(id<TIStateSubscriber>)subscriber;
- (void)unsusbcribe:(id<TIStateSubscriber>)subscriber;

- (__kindof TIState *)getState;

// 只能通过该方法修改状态
- (void)dispatch:(__kindof TIDispatchAction *)action;

@end

NS_ASSUME_NONNULL_END
