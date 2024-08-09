//
//  TIReducer.h
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TIDispatchAction, TIState;

@protocol TIReducer <NSObject>

@required
- (__kindof TIState *)dispatch:(TIDispatchAction *)action state:(__kindof TIState *)state;

@end


NS_ASSUME_NONNULL_END
