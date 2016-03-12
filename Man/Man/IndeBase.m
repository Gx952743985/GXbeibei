//
//  IndeBase.m
//
//  Created by   on 16/3/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "IndeBase.h"


NSString *const kIndeBaseTitle = @"title";
NSString *const kIndeBaseIcon = @"icon";
NSString *const kIndeBaseType = @"type";
NSString *const kIndeBaseApiurl = @"apiurl";


@interface IndeBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation IndeBase

@synthesize title = _title;
@synthesize icon = _icon;
@synthesize type = _type;
@synthesize apiurl = _apiurl;


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
            self.title = [self objectOrNilForKey:kIndeBaseTitle fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kIndeBaseIcon fromDictionary:dict];
            self.type = [self objectOrNilForKey:kIndeBaseType fromDictionary:dict];
            self.apiurl = [self objectOrNilForKey:kIndeBaseApiurl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kIndeBaseTitle];
    [mutableDict setValue:self.icon forKey:kIndeBaseIcon];
    [mutableDict setValue:self.type forKey:kIndeBaseType];
    [mutableDict setValue:self.apiurl forKey:kIndeBaseApiurl];

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

    self.title = [aDecoder decodeObjectForKey:kIndeBaseTitle];
    self.icon = [aDecoder decodeObjectForKey:kIndeBaseIcon];
    self.type = [aDecoder decodeObjectForKey:kIndeBaseType];
    self.apiurl = [aDecoder decodeObjectForKey:kIndeBaseApiurl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kIndeBaseTitle];
    [aCoder encodeObject:_icon forKey:kIndeBaseIcon];
    [aCoder encodeObject:_type forKey:kIndeBaseType];
    [aCoder encodeObject:_apiurl forKey:kIndeBaseApiurl];
}

- (id)copyWithZone:(NSZone *)zone
{
    IndeBase *copy = [[IndeBase alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.apiurl = [self.apiurl copyWithZone:zone];
    }
    
    return copy;
}


@end
