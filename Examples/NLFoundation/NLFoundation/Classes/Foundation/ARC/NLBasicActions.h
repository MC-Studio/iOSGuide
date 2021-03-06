//
//  NLBasicActions.h
//  Neverland
//
//  Created by Rake Yang on 2019/9/5.
//  Copyright © 2019 BinaryParadise. All rights reserved.
//

#import <NLRouterAction/NLRouterActionBase.h>

NS_ASSUME_NONNULL_BEGIN

@interface NLBasicActions : NLRouterActionBase

PGMethod(kvoDemo, "fd://Foundation/KVO?c=Key-Value Observing");

PGMethod(kvcDemo, "fd://Foundation/KVC/KVC?c=Key-Value Coding");

PGMethod(arcDemo, "fd://Foundation/ARC?c=自动内存管理");

@end

NS_ASSUME_NONNULL_END
