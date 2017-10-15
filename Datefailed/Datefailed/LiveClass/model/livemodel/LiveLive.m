//
//  LiveLive.m
//
//  Created by Code  on 17/3/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LiveLive.h"
#import "LiveData.h"


NSString *const kLiveLiveError = @"error";
NSString *const kLiveLiveData = @"data";


@interface LiveLive ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LiveLive

@synthesize error = _error;
@synthesize data = _data;


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
            self.error = [[self objectOrNilForKey:kLiveLiveError fromDictionary:dict] doubleValue];
    NSObject *receivedLiveData = [dict objectForKey:kLiveLiveData];
    NSMutableArray *parsedLiveData = [NSMutableArray array];
    if ([receivedLiveData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLiveData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLiveData addObject:[LiveData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLiveData isKindOfClass:[NSDictionary class]]) {
       [parsedLiveData addObject:[LiveData modelObjectWithDictionary:(NSDictionary *)receivedLiveData]];
    }

    self.data = [NSArray arrayWithArray:parsedLiveData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.error] forKey:kLiveLiveError];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kLiveLiveData];

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

    self.error = [aDecoder decodeDoubleForKey:kLiveLiveError];
    self.data = [aDecoder decodeObjectForKey:kLiveLiveData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_error forKey:kLiveLiveError];
    [aCoder encodeObject:_data forKey:kLiveLiveData];
}

- (id)copyWithZone:(NSZone *)zone
{
    LiveLive *copy = [[LiveLive alloc] init];
    
    if (copy) {

        copy.error = self.error;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
