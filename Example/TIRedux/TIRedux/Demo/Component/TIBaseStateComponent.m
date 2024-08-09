//
//  TIBaseStateComponent.m
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import "TIBaseStateComponent.h"
#import "TIRedux.h"
#import "TICustomState.h"

@interface TIBaseStateComponent ()

@property (nonatomic, weak, readwrite) TIStore *store;

@end

@implementation TIBaseStateComponent

- (instancetype)initWithStore:(TIStore *)store
{
    self = [super init];
    if (self) {
        self.store = store;
        [self setupSubscriber];
        self.view.layer.cornerRadius = 8;
        self.view.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setupSubscriber {
    [self.store susbcribe:self];
}

#pragma mark - TIStateSubscriber
- (void)didChangedState:(__kindof TIState *)newState oldState:(__kindof TIState *)oldState {
    
}

- (TICustomState *)getState {
    TIState *state = self.store.getState;
    if ([state isKindOfClass:[TICustomState class]]) {
        return (TICustomState *)state;
    }
    return nil;
}

- (void)dealloc {
    [self.store unsusbcribe:self];
}

@end
