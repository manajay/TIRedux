//
//  TIComponent.h
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TIComponentView : UIView
@property (nonatomic, copy, readwrite) void(^didLayoutSubviewsBlock)(TIComponentView *view);
@end

@protocol TIComponentProtocol <NSObject>

@required
@property (nonatomic, strong) TIComponentView *view;
- (void)setupUI;

@end

@interface TIComponent : NSObject<TIComponentProtocol>

@property (nonatomic, strong) TIComponentView *view;

@end


NS_ASSUME_NONNULL_END
