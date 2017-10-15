//
//  HotHot.m
//
//  Created by Code  on 17/3/7
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotHot.h"
#import "HotData.h"


NSString *const kHotHotMsg = @"msg";
NSString *const kHotHotData = @"data";
NSString *const kHotHotCode = @"code";


@interface HotHot ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotHot

@synthesize msg = _msg;
@synthesize data = _data;
@synthesize code = _code;


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
            self.msg = [self objectOrNilForKey:kHotHotMsg fromDictionary:dict];
            self.data = [HotData modelObjectWithDictionary:[dict objectForKey:kHotHotData]];
            self.code = [self objectOrNilForKey:kHotHotCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kHotHotMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kHotHotData];
    [mutableDict setValue:self.code forKey:kHotHotCode];

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

    self.msg = [aDecoder decodeObjectForKey:kHotHotMsg];
    self.data = [aDecoder decodeObjectForKey:kHotHotData];
    self.code = [aDecoder decodeObjectForKey:kHotHotCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kHotHotMsg];
    [aCoder encodeObject:_data forKey:kHotHotData];
    [aCoder encodeObject:_code forKey:kHotHotCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotHot *copy = [[HotHot alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
