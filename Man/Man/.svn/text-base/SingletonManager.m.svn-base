//
//  SingletonManager.m
//  Test_singleton_ARC
//
//  Created by SuperWang on 16/1/4.
//  Copyright (c) 2016年 智游. All rights reserved.
//

#import "SingletonManager.h"

//ARC
@implementation SingletonManager
//易于外部访问
+(SingletonManager*)sharedManager
{
    static SingletonManager *manager = nil;
    
    static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
 

    
    return manager;
}

-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
//根据一个连接返回数据
+ (void)GXMenulisturl:(NSString*)urlstr completion:(CompletionBlock)cBlock
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSString * encodedString = [urlstr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSURL *URL = [NSURL URLWithString:encodedString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            
            if (responseObject) {
                cBlock(responseObject);
            }
            
        }
    }];
    
    [dataTask resume];
    
}
+ (void)GXlisturl:(NSString*)urlstr completion:(CompBlock)cBlock
{

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSString * encodedString = [urlstr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSURL *URL = [NSURL URLWithString:encodedString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            
            if (responseObject) {
                cBlock(responseObject);
            }
            
        }
    }];
    
    [dataTask resume];
}

//取色
+(UIColor*)initcolor:(NSString*)url
{
    long red=strtol([[url substringWithRange:NSMakeRange(0, 2)]UTF8String], 0, 16);
    long green=strtol([[url substringWithRange:NSMakeRange(2, 2)]UTF8String], 0, 16);
    long blue=strtol([[url substringWithRange:NSMakeRange(4, 2)]UTF8String], 0, 16);
    UIColor *cl=[UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
    return cl;
}

@end












