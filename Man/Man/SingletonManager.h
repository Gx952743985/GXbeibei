//
//  SingletonManager.h
//  Test_singleton_ARC
//
//  Created by SuperWang on 16/1/4.
//  Copyright (c) 2016年 智游. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^CompletionBlock)(NSMutableArray *dic);
typedef void (^CompBlock)(NSDictionary *dic);
@interface SingletonManager : NSObject
//外部访问的量
+ (SingletonManager*)sharedManager;
//根据一个连接返回数据
+ (void)GXMenulisturl:(NSString*)urlstr completion:(CompletionBlock)cBlock;
//根据一个连接返回数据
+ (void)GXlisturl:(NSString*)urlstr completion:(CompBlock)cBlock;
//取色
+(UIColor*)initcolor:(NSString*)url;
@end
