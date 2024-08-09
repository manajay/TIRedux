//
//  TIHeaderComponent.m
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//

#import "TIHeaderComponent.h"
#import "TIRedux.h"
#import "TICustomState.h"

@interface TIHeaderComponent ()<TIStateSubscriber>

@property (nonatomic, assign, readwrite) NSInteger refreshCount;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;

@end

@implementation TIHeaderComponent

- (void)setupUI {
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.titleLabel];
    __weak __typeof(TIHeaderComponent *) weakSelf = self;
    self.view.didLayoutSubviewsBlock = ^(TIComponentView * _Nonnull view) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.titleLabel.frame = CGRectMake(16, 12, view.frame.size.width - 16 * 2, 50);
    };
    TICustomState *state = self.getState;
    [self refreshUI:state oldState:state];
}

- (void)refreshUI:(TICustomState * _Nonnull)newState oldState:(TICustomState * _Nonnull)oldState {
    self.refreshCount ++;
    self.titleLabel.text = [NSString stringWithFormat:@"header title: click count %zd, refreshCount:%zd", self.getState.headerCount, self.refreshCount];
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
