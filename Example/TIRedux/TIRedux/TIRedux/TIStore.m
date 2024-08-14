//
//  TIStore.m
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import "TIStore.h"
#import "TIState.h"
#import "TIStateSubscriber.h"
#import "TIDispatchAction.h"
#import "TIReducer.h"

@interface TIStore ()

@property (nonatomic, strong, readwrite) TIState *state;
//TODO: 线程安全数组, 且能存储 weak pointer
@property (nonatomic, strong, readwrite) NSMutableArray<id<TIStateSubscriber>> *subscribers;
@property (nonatomic, strong, readwrite) id<TIReducer> reducer;
@end

@implementation TIStore

- (instancetype)initWithInitState:(__kindof TIState *)initState reducer:(id<TIReducer>)reducer {
    self = [super init];
    if (self) {
        self.state = initState;
        self.subscribers = [NSMutableArray array];
        self.reducer = reducer;
    }
    return self;
}

- (void)susbcribe:(id<TIStateSubscriber>)subscriber {
    @synchronized (self) {
        if (!subscriber) {
            return;
        }
        [self.subscribers addObject:subscriber];
    }
}

- (void)unsusbcribe:(id<TIStateSubscriber>)subscriber {
    @synchronized (self) {
        if (!subscriber) {
            return;
        }
        if ([self.subscribers containsObject:subscriber]) {
            [self.subscribers removeObject:subscriber];
        }
    }
}

- (void)changeState:(__kindof TIState * _Nonnull )newState oldState:(__kindof TIState * _Nonnull )oldState {
    [self.subscribers enumerateObjectsUsingBlock:^(id<TIStateSubscriber> obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj didChangedState:newState oldState:oldState];
    }];
}

- (__kindof TIState *)getState {
    return self.state;
}

- (void)dispatch:(__kindof TIDispatchAction *)action {
    TIState *state = [self getState];
    TIState *newState = [self.reducer dispatch:action state:state];
    self.state = newState;
    [self changeState:newState oldState:state];
}

@end
