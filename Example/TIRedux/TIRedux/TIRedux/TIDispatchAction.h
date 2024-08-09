//
//  TIDispatchAction.h
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString * TIDispatchActionType;

/**
 行为:  用户行为或者数据变化等行为
 通过增加这一层， 让数据的变化有约束， 不能随意改变状态， 只能通过定义行为去改变
 @param: type 行为类型
 行为 携带需要改变的数据， 通过继承 去扩展
 */
@interface TIDispatchAction : NSObject

// 事件类型
@property (nonatomic, copy, readonly) TIDispatchActionType type;

@end

NS_ASSUME_NONNULL_END
