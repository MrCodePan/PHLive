//
//  LiveIconData.m
//
//  Created by Code  on 17/3/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LiveIconData.h"


NSString *const kLiveIconDataStatus = @"status";
NSString *const kLiveIconDataIconUrl = @"icon_url";
NSString *const kLiveIconDataIconWidth = @"icon_width";
NSString *const kLiveIconDataIconHeight = @"icon_height";


@interface LiveIconData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LiveIconData

@synthesize status = _status;
@synthesize iconUrl = _iconUrl;
@synthesize iconWidth = _iconWidth;
@synthesize iconHeight = _iconHeight;


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
            self.status = [[self objectOrNilForKey:kLiveIconDataStatus fromDictionary:dict] doubleValue];
            self.iconUrl = [self objectOrNilForKey:kLiveIconDataIconUrl fromDictionary:dict];
            self.iconWidth = [[self objectOrNilForKey:kLiveIconDataIconWidth fromDictionary:dict] doubleValue];
            self.iconHeight = [[self objectOrNilForKey:kLiveIconDataIconHeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kLiveIconDataStatus];
    [mutableDict setValue:self.iconUrl forKey:kLiveIconDataIconUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iconWidth] forKey:kLiveIconDataIconWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iconHeight] forKey:kLiveIconDataIconHeight];

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

    self.status = [aDecoder decodeDoubleForKey:kLiveIconDataStatus];
    self.iconUrl = [aDecoder decodeObjectForKey:kLiveIconDataIconUrl];
    self.iconWidth = [aDecoder decodeDoubleForKey:kLiveIconDataIconWidth];
    self.iconHeight = [aDecoder decodeDoubleForKey:kLiveIconDataIconHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kLiveIconDataStatus];
    [aCoder encodeObject:_iconUrl forKey:kLiveIconDataIconUrl];
    [aCoder encodeDouble:_iconWidth forKey:kLiveIconDataIconWidth];
    [aCoder encodeDouble:_iconHeight forKey:kLiveIconDataIconHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    LiveIconData *copy = [[LiveIconData alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.iconUrl = [self.iconUrl copyWithZone:zone];
        copy.iconWidth = self.iconWidth;
        copy.iconHeight = self.iconHeight;
    }
    
    return copy;
}


@end
