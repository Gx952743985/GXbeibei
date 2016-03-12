//
//  ZLBata.h
//
//  Created by   on 16/3/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZLBata : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *articles;
@property (nonatomic, assign) double timestamp;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
