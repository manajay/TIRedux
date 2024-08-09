//
//  TIBaseStateComponent.h
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import "TIComponent.h"
#import "TIStateSubscriber.h"

NS_ASSUME_NONNULL_BEGIN

@class TIStore, TICustomState;

@interface TIBaseStateComponent : TIComponent<TIStateSubscriber>

@property (nonatomic, weak, readonly) TIStore *store;

- (instancetype)initWithStore:(TIStore *)store;
- (TICustomState *)getState;

@end

NS_ASSUME_NONNULL_END
