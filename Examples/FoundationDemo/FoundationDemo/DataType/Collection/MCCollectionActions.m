//
//  JSNSArrayViewController.m
//  FoundationDemo
//
//  Created by Rake Yang on 2019/2/2.
//  Copyright © 2019 BinaryParadise. All rights reserved.
//

#import "MCCollectionActions.h"
#import "NSMutableArray+JSSafety.h"
#import "FDNSArrayViewController.h"

static NSMutableArray *_marr;
@interface MCCollectionActions ()

@end

@implementation MCCollectionActions

+ (void)unsafeArray:(PGRouterContext *)context {
    [self safeArray:context];
}

+ (void)safeArray:(PGRouterContext *)context {
    // Do any additional setup after loading the view.
    NSMutableArray *marr = [NSMutableArray array];

    MACH_TIME_START
    for (NSInteger i=0; i< 65535 * 1000; i++) {
        [marr addObject:@(i)];
    }
    MACH_TIME_END(@"构造数据")

    _marr = marr;

    __block BOOL running = YES;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        MACH_TIME_START
        __block BOOL show = YES;
        if ([context.userInfo mc_boolForKey:@"safe"]) {
            [marr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (!running && show) {
                    MCLogWarn(@"%@", obj);
                    show = NO;
                }
            }];
        } else {
            @try {
                //不要直接遍历NSMutableArray
                for (id obj1 in marr) {//遍历的同时元素被修改导致crash
                    if (!running && show) {
                        MCLogWarn(@"%@", obj1);
                        show = NO;
                    }
                }
            } @catch (NSException *exception) {
                MCLogError(@"%@", exception);
            } @finally {
                
            }
            
        }
        MACH_TIME_END(@"遍历完成")
        [context finished];
    });

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        MCLogDebug(@"休眠");
        [NSThread sleepForTimeInterval:0.2];
        MCLogDebug(@"取消");
        running = NO;
        MCLogInfo(@"遍历移除数组元素[52428000-58981500]");
        for (NSUInteger i=65535*800; i<=65535*900; i++) {
            [marr removeObjectAtIndex:i];
        }
        MCLogDebug(@"移除完成...");
    });
}

+ (void)uiDemo:(PGRouterContext *)context {
    UIViewController *vc = [[FDNSArrayViewController alloc] initWithNibName:nil bundle:nil];
    [self pushViewController:vc animated:YES];
    [context finished];
}

@end