//
//  ZLBata.m
//
//  Created by   on 16/3/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZLBata.h"
#import "ZLArticles.h"


NSString *const kZLBataArticles = @"articles";
NSString *const kZLBataTimestamp = @"timestamp";


@interface ZLBata ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZLBata

@synthesize articles = _articles;
@synthesize timestamp = _timestamp;


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
    NSObject *receivedZLArticles = [dict objectForKey:kZLBataArticles];
    NSMutableArray *parsedZLArticles = [NSMutableArray array];
    if ([receivedZLArticles isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZLArticles) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZLArticles addObject:[ZLArticles modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZLArticles isKindOfClass:[NSDictionary class]]) {
       [parsedZLArticles addObject:[ZLArticles modelObjectWithDictionary:(NSDictionary *)receivedZLArticles]];
    }

    self.articles = [NSArray arrayWithArray:parsedZLArticles];
            self.timestamp = [[self objectOrNilForKey:kZLBataTimestamp fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForArticles = [NSMutableArray array];
    for (NSObject *subArrayObject in self.articles) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForArticles addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForArticles addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForArticles] forKey:kZLBataArticles];
    [mutableDict setValue:[NSNumber numberWithDouble:self.timestamp] forKey:kZLBataTimestamp];

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

    self.articles = [aDecoder decodeObjectForKey:kZLBataArticles];
    self.timestamp = [aDecoder decodeDoubleForKey:kZLBataTimestamp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_articles forKey:kZLBataArticles];
    [aCoder encodeDouble:_timestamp forKey:kZLBataTimestamp];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZLBata *copy = [[ZLBata alloc] init];
    
    if (copy) {

        copy.articles = [self.articles copyWithZone:zone];
        copy.timestamp = self.timestamp;
    }
    
    return copy;
}


@end
