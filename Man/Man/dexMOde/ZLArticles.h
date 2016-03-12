//
//  ZLArticles.h
//
//  Created by   on 16/3/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZLArticles : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *articlesIdentifier;
@property (nonatomic, strong) NSString *sectionName;
@property (nonatomic, strong) NSString *sectionImage;
@property (nonatomic, strong) NSString *authorAvatar;
@property (nonatomic, strong) NSString *hitCountString;
@property (nonatomic, strong) NSString *sectionColor;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *shareImage;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) NSString *authorName;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *displayDate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
