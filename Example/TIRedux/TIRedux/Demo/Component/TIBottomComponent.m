//
//  TIBottomComponent.m
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import "TIBottomComponent.h"
#import "TICustomState.h"
#import "TIRedux.h"

@interface TIBottomComponent ()<TIStateSubscriber>

@property (nonatomic, assign, readwrite) NSInteger refreshCount;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;

@end

@implementation TIBottomComponent

- (void)setupUI {
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.titleLabel];
    __weak __typeof(TIBottomComponent *) weakSelf = self;
    self.view.didLayoutSubviewsBlock = ^(TIComponentView * _Nonnull view) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.titleLabel.frame = CGRectMake(16, 12, view.frame.size.width - 16 * 2, 50);
    };
    
    TICustomState *state = self.getState;
    [self refreshUI:state oldState:state];
}

- (void)refreshUI:(TICustomState * _Nonnull)newState oldState:(TICustomState * _Nonnull)oldState {
    self.refreshCount ++;
    self.titleLabel.text = [NSString stringWithFormat:@"bottom title: click count %zd, refreshCount:%zd ", self.getState.bottomCount,
                            self.refreshCount];
}

#pragma mark - TIStateSubscriber
- (void)didChangedState:(__kindof TIState *)newState oldState:(__kindof TIState *)oldState {
    [self refreshUI:newState oldState:oldState];
}

#pragma mark - Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [UILabel new];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 2;
        _titleLabel = label;
    }
    return _titleLabel;
}

@end
