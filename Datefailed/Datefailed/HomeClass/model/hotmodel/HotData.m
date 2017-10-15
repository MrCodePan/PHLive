//
//  HotData.m
//
//  Created by Code  on 17/3/7
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotData.h"
#import "HotList.h"


NSString *const kHotDataCounts = @"counts";
NSString *const kHotDataList = @"list";


@interface HotData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotData

@synthesize counts = _counts;
@synthesize list = _list;


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
            self.counts = [[self objectOrNilForKey:kHotDataCounts fromDictionary:dict] doubleValue];
    NSObject *receivedHotList = [dict objectForKey:kHotDataList];
    NSMutableArray *parsedHotList = [NSMutableArray array];
    if ([receivedHotList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotList addObject:[HotList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotList isKindOfClass:[NSDictionary class]]) {
       [parsedHotList addObject:[HotList modelObjectWithDictionary:(NSDictionary *)receivedHotList]];
    }

    self.list = [NSArray arrayWithArray:parsedHotList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.counts] forKey:kHotDataCounts];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kHotDataList];

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

    self.counts = [aDecoder decodeDoubleForKey:kHotDataCounts];
    self.list = [aDecoder decodeObjectForKey:kHotDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_counts forKey:kHotDataCounts];
    [aCoder encodeObject:_list forKey:kHotDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotData *copy = [[HotData alloc] init];
    
    if (copy) {

        copy.counts = self.counts;
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
