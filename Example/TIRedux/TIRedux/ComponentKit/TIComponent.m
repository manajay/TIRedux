//
//  TIComponent.m
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//

#import "TIComponent.h"

@implementation TIComponentView

- (void)layoutSubviews {
    if (self.didLayoutSubviewsBlock) {
        self.didLayoutSubviewsBlock(self);
    }
}

@end

@implementation TIComponent

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
}

#pragma mark - TIComponentProtocol
- (TIComponentView *)view {
    if (!_view) {
        _view = [TIComponentView new];
    }
    return _view;
}


@end


