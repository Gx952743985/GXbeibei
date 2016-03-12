//
//  ZYData.m
//
//  Created by   on 16/3/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZYData.h"


NSString *const kZYDataThumbnail = @"thumbnail";
NSString *const kZYDataId = @"id";
NSString *const kZYDataUniqId = @"uniq_id";
NSString *const kZYDataDescription = @"description";
NSString *const kZYDataName = @"name";
NSString *const kZYDataColor = @"color";


@interface ZYData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYData

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
            self.thumbnail = [self objectOrNilForKey:kZYDataThumbnail fromDictionary:dict];
            self.dataIdentifier = [[self objectOrNilForKey:kZYDataId fromDictionary:dict] doubleValue];
            self.uniqId = [self objectOrNilForKey:kZYDataUniqId fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kZYDataDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZYDataName fromDictionary:dict];
            self.color = [self objectOrNilForKey:kZYDataColor fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.thumbnail forKey:kZYDataThumbnail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kZYDataId];
    [mutableDict setValue:self.uniqId forKey:kZYDataUniqId];
    [mutableDict setValue:self.dataDescription forKey:kZYDataDescription];
    [mutableDict setValue:self.name forKey:kZYDataName];
    [mutableDict setValue:self.color forKey:kZYDataColor];

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

    self.thumbnail = [aDecoder decodeObjectForKey:kZYDataThumbnail];
    self.dataIdentifier = [aDecoder decodeDoubleForKey:kZYDataId];
    self.uniqId = [aDecoder decodeObjectForKey:kZYDataUniqId];
    self.dataDescription = [aDecoder decodeObjectForKey:kZYDataDescription];
    self.name = [aDecoder decodeObjectForKey:kZYDataName];
    self.color = [aDecoder decodeObjectForKey:kZYDataColor];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_thumbnail forKey:kZYDataThumbnail];
    [aCoder encodeDouble:_dataIdentifier forKey:kZYDataId];
    [aCoder encodeObject:_uniqId forKey:kZYDataUniqId];
    [aCoder encodeObject:_dataDescription forKey:kZYDataDescription];
    [aCoder encodeObject:_name forKey:kZYDataName];
    [aCoder encodeObject:_color forKey:kZYDataColor];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYData *copy = [[ZYData alloc] init];
    
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
