//
//  ZYData.h
//
//  Created by   on 16/3/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZYData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *uniqId;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *color;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
