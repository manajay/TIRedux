//
//  TIState.h
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 不能直接修改， 只能由 Reducer 创建新的
@interface TIState : NSObject<NSCopying>

- (__kindof TIState *)generateNewState;

@end

NS_ASSUME_NONNULL_END
