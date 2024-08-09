//
//  TICustomState.h
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import "TIState.h"

NS_ASSUME_NONNULL_BEGIN

@interface TICustomState : TIState

@property (nonatomic, assign, readwrite) NSInteger headerCount;
@property (nonatomic, assign, readwrite) NSInteger middleCount;
@property (nonatomic, assign, readwrite) NSInteger bottomCount;

@end

NS_ASSUME_NONNULL_END
