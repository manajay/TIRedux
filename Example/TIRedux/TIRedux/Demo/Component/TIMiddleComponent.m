//
//  TIMiddleComponent.m
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import "TIMiddleComponent.h"
#import "TICustomState.h"
#import "TIRedux.h"
#import "TIMiddleClickCountIncrementDispatchAction.h"

@interface TIMiddleComponent ()<TIStateSubscriber>

@property (nonatomic, assign, readwrite) NSInteger refreshCount;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UIButton *refreshButton;

@end

@implementation TIMiddleComponent

- (void)setupUI {
    self.view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.refreshButton];
    __weak __typeof(TIMiddleComponent *) weakSelf = self;
    self.view.didLayoutSubviewsBlock = ^(TIComponentView * _Nonnull view) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.titleLabel.frame = CGRectMake(16, 12, view.frame.size.width - 16 * 2, 50);
        strongSelf.refreshButton.frame = CGRectMake(50, 60, view.frame.size.width - 50 * 2, 30);
    };
    
    TICustomState *state = self.getState;
    [self refreshUI:state oldState:state];
}

- (void)refreshUI:(TICustomState * _Nonnull)newState oldState:(TICustomState * _Nonnull)oldState {
    self.refreshCount++;
    self.titleLabel.text = [NSString stringWithFormat:@"middle title: click count %zd, refreshCount:%zd", self.getState.middleCount, self.refreshCount];
}

#pragma mark - TIStateSubscriber
- (void)didChangedState:(__kindof TIState *)newState oldState:(__kindof TIState *)oldState {
    [self refreshUI:newState oldState:oldState];
}

#pragma mark - Event
- (void)didTappedButton {
    // 修改数值
    TIMiddleClickCountIncrementDispatchAction *action = [TIMiddleClickCountIncrementDispatchAction new];
    [self.store dispatch:action];
    NSLog(@"[[tap refresh button]]: %zd", self.getState.middleCount);
}

#pragma mark - Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [UILabel new];
        label.textColor = [UIColor whiteColor];
        label.numberOfLines = 2;
        label.textAlignment = NSTextAlignmentCenter;
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UIButton *)refreshButton {
    if (!_refreshButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"Refresh" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        button.backgroundColor = [UIColor redColor];
        button.layer.cornerRadius = 15;
        button.layer.masksToBounds = YES;
        [button addTarget:self action:@selector(didTappedButton) forControlEvents:UIControlEventTouchUpInside];
        _refreshButton = button;
    }
    return _refreshButton;
}

@end
