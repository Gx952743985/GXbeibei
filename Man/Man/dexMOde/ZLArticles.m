//
//  ZLArticles.m
//
//  Created by   on 16/3/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZLArticles.h"


NSString *const kZLArticlesId = @"id";
NSString *const kZLArticlesSectionName = @"section_name";
NSString *const kZLArticlesSectionImage = @"section_image";
NSString *const kZLArticlesAuthorAvatar = @"author_avatar";
NSString *const kZLArticlesHitCountString = @"hit_count_string";
NSString *const kZLArticlesSectionColor = @"section_color";
NSString *const kZLArticlesUrl = @"url";
NSString *const kZLArticlesTitle = @"title";
NSString *const kZLArticlesDate = @"date";
NSString *const kZLArticlesShareImage = @"share_image";
NSString *const kZLArticlesShareUrl = @"share_url";
NSString *const kZLArticlesAuthorName = @"author_name";
NSString *const kZLArticlesThumbnail = @"thumbnail";
NSString *const kZLArticlesDisplayDate = @"display_date";


@interface ZLArticles ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZLArticles

@synthesize articlesIdentifier = _articlesIdentifier;
@synthesize sectionName = _sectionName;
@synthesize sectionImage = _sectionImage;
@synthesize authorAvatar = _authorAvatar;
@synthesize hitCountString = _hitCountString;
@synthesize sectionColor = _sectionColor;
@synthesize url = _url;
@synthesize title = _title;
@synthesize date = _date;
@synthesize shareImage = _shareImage;
@synthesize shareUrl = _shareUrl;
@synthesize authorName = _authorName;
@synthesize thumbnail = _thumbnail;
@synthesize displayDate = _displayDate;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.articlesIdentifier = [self objectOrNilForKey:kZLArticlesId fromDictionary:dict];
            self.sectionName = [self objectOrNilForKey:kZLArticlesSectionName fromDictionary:dict];
            self.sectionImage = [self objectOrNilForKey:kZLArticlesSectionImage fromDictionary:dict];
            self.authorAvatar = [self objectOrNilForKey:kZLArticlesAuthorAvatar fromDictionary:dict];
            self.hitCountString = [self objectOrNilForKey:kZLArticlesHitCountString fromDictionary:dict];
            self.sectionColor = [self objectOrNilForKey:kZLArticlesSectionColor fromDictionary:dict];
            self.url = [self objectOrNilForKey:kZLArticlesUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kZLArticlesTitle fromDictionary:dict];
            self.date = [self objectOrNilForKey:kZLArticlesDate fromDictionary:dict];
            self.shareImage = [self objectOrNilForKey:kZLArticlesShareImage fromDictionary:dict];
            self.shareUrl = [self objectOrNilForKey:kZLArticlesShareUrl fromDictionary:dict];
            self.authorName = [self objectOrNilForKey:kZLArticlesAuthorName fromDictionary:dict];
            self.thumbnail = [self objectOrNilForKey:kZLArticlesThumbnail fromDictionary:dict];
            self.displayDate = [self objectOrNilForKey:kZLArticlesDisplayDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.articlesIdentifier forKey:kZLArticlesId];
    [mutableDict setValue:self.sectionName forKey:kZLArticlesSectionName];
    [mutableDict setValue:self.sectionImage forKey:kZLArticlesSectionImage];
    [mutableDict setValue:self.authorAvatar forKey:kZLArticlesAuthorAvatar];
    [mutableDict setValue:self.hitCountString forKey:kZLArticlesHitCountString];
    [mutableDict setValue:self.sectionColor forKey:kZLArticlesSectionColor];
    [mutableDict setValue:self.url forKey:kZLArticlesUrl];
    [mutableDict setValue:self.title forKey:kZLArticlesTitle];
    [mutableDict setValue:self.date forKey:kZLArticlesDate];
    [mutableDict setValue:self.shareImage forKey:kZLArticlesShareImage];
    [mutableDict setValue:self.shareUrl forKey:kZLArticlesShareUrl];
    [mutableDict setValue:self.authorName forKey:kZLArticlesAuthorName];
    [mutableDict setValue:self.thumbnail forKey:kZLArticlesThumbnail];
    [mutableDict setValue:self.displayDate forKey:kZLArticlesDisplayDate];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.articlesIdentifier = [aDecoder decodeObjectForKey:kZLArticlesId];
    self.sectionName = [aDecoder decodeObjectForKey:kZLArticlesSectionName];
    self.sectionImage = [aDecoder decodeObjectForKey:kZLArticlesSectionImage];
    self.authorAvatar = [aDecoder decodeObjectForKey:kZLArticlesAuthorAvatar];
    self.hitCountString = [aDecoder decodeObjectForKey:kZLArticlesHitCountString];
    self.sectionColor = [aDecoder decodeObjectForKey:kZLArticlesSectionColor];
    self.url = [aDecoder decodeObjectForKey:kZLArticlesUrl];
    self.title = [aDecoder decodeObjectForKey:kZLArticlesTitle];
    self.date = [aDecoder decodeObjectForKey:kZLArticlesDate];
    self.shareImage = [aDecoder decodeObjectForKey:kZLArticlesShareImage];
    self.shareUrl = [aDecoder decodeObjectForKey:kZLArticlesShareUrl];
    self.authorName = [aDecoder decodeObjectForKey:kZLArticlesAuthorName];
    self.thumbnail = [aDecoder decodeObjectForKey:kZLArticlesThumbnail];
    self.displayDate = [aDecoder decodeObjectForKey:kZLArticlesDisplayDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_articlesIdentifier forKey:kZLArticlesId];
    [aCoder encodeObject:_sectionName forKey:kZLArticlesSectionName];
    [aCoder encodeObject:_sectionImage forKey:kZLArticlesSectionImage];
    [aCoder encodeObject:_authorAvatar forKey:kZLArticlesAuthorAvatar];
    [aCoder encodeObject:_hitCountString forKey:kZLArticlesHitCountString];
    [aCoder encodeObject:_sectionColor forKey:kZLArticlesSectionColor];
    [aCoder encodeObject:_url forKey:kZLArticlesUrl];
    [aCoder encodeObject:_title forKey:kZLArticlesTitle];
    [aCoder encodeObject:_date forKey:kZLArticlesDate];
    [aCoder encodeObject:_shareImage forKey:kZLArticlesShareImage];
    [aCoder encodeObject:_shareUrl forKey:kZLArticlesShareUrl];
    [aCoder encodeObject:_authorName forKey:kZLArticlesAuthorName];
    [aCoder encodeObject:_thumbnail forKey:kZLArticlesThumbnail];
    [aCoder encodeObject:_displayDate forKey:kZLArticlesDisplayDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZLArticles *copy = [[ZLArticles alloc] init];
    
    if (copy) {

        copy.articlesIdentifier = [self.articlesIdentifier copyWithZone:zone];
        copy.sectionName = [self.sectionName copyWithZone:zone];
        copy.sectionImage = [self.sectionImage copyWithZone:zone];
        copy.authorAvatar = [self.authorAvatar copyWithZone:zone];
        copy.hitCountString = [self.hitCountString copyWithZone:zone];
        copy.sectionColor = [self.sectionColor copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.shareImage = [self.shareImage copyWithZone:zone];
        copy.shareUrl = [self.shareUrl copyWithZone:zone];
        copy.authorName = [self.authorName copyWithZone:zone];
        copy.thumbnail = [self.thumbnail copyWithZone:zone];
        copy.displayDate = [self.displayDate copyWithZone:zone];
    }
    
    return copy;
}


@end
