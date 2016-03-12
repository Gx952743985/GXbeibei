//
//  ZLData.m
//
//  Created by   on 16/3/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZLData.h"


NSString *const kZLDataThumbnail = @"thumbnail";
NSString *const kZLDataId = @"id";
NSString *const kZLDataUniqId = @"uniq_id";
NSString *const kZLDataDescription = @"description";
NSString *const kZLDataName = @"name";
NSString *const kZLDataColor = @"color";


@interface ZLData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZLData

@synthesize thumbnail = _thumbnail;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize uniqId = _uniqId;
@synthesize dataDescription = _dataDescription;
@synthesize name = _name;
@synthesize color = _color;



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
            self.thumbnail = [self objectOrNilForKey:kZLDataThumbnail fromDictionary:dict];
            self.dataIdentifier = [[self objectOrNilForKey:kZLDataId fromDictionary:dict] doubleValue];
            self.uniqId = [self objectOrNilForKey:kZLDataUniqId fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kZLDataDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZLDataName fromDictionary:dict];
            self.color = [self objectOrNilForKey:kZLDataColor fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.thumbnail forKey:kZLDataThumbnail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kZLDataId];
    [mutableDict setValue:self.uniqId forKey:kZLDataUniqId];
    [mutableDict setValue:self.dataDescription forKey:kZLDataDescription];
    [mutableDict setValue:self.name forKey:kZLDataName];
    [mutableDict setValue:self.color forKey:kZLDataColor];


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

    self.thumbnail = [aDecoder decodeObjectForKey:kZLDataThumbnail];
    self.dataIdentifier = [aDecoder decodeDoubleForKey:kZLDataId];
    self.uniqId = [aDecoder decodeObjectForKey:kZLDataUniqId];
    self.dataDescription = [aDecoder decodeObjectForKey:kZLDataDescription];
    self.name = [aDecoder decodeObjectForKey:kZLDataName];
    self.color = [aDecoder decodeObjectForKey:kZLDataColor];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_thumbnail forKey:kZLDataThumbnail];
    [aCoder encodeDouble:_dataIdentifier forKey:kZLDataId];
    [aCoder encodeObject:_uniqId forKey:kZLDataUniqId];
    [aCoder encodeObject:_dataDescription forKey:kZLDataDescription];
    [aCoder encodeObject:_name forKey:kZLDataName];
    [aCoder encodeObject:_color forKey:kZLDataColor];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZLData *copy = [[ZLData alloc] init];
    
    if (copy) {

        copy.thumbnail = [self.thumbnail copyWithZone:zone];
        copy.dataIdentifier = self.dataIdentifier;
        copy.uniqId = [self.uniqId copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.color = [self.color copyWithZone:zone];
    }
    
    return copy;
}


@end
