//
//  HotList.m
//
//  Created by Code  on 17/3/7
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotList.h"


NSString *const kHotListGps = @"gps";
NSString *const kHotListFamilyName = @"familyName";
NSString *const kHotListSignatures = @"signatures";
NSString *const kHotListNationFlag = @"nationFlag";
NSString *const kHotListStarlevel = @"starlevel";
NSString *const kHotListUseridx = @"useridx";
NSString *const kHotListBigpic = @"bigpic";
NSString *const kHotListSmallpic = @"smallpic";
NSString *const kHotListIsSign = @"isSign";
NSString *const kHotListMyname = @"myname";
NSString *const kHotListFlv = @"flv";
NSString *const kHotListNation = @"nation";
NSString *const kHotListRoomid = @"roomid";
NSString *const kHotListCurexp = @"curexp";
NSString *const kHotListAllnum = @"allnum";
NSString *const kHotListPos = @"pos";
NSString *const kHotListGender = @"gender";
NSString *const kHotListGrade = @"grade";
NSString *const kHotListLevel = @"level";
NSString *const kHotListDistance = @"distance";
NSString *const kHotListServerid = @"serverid";
NSString *const kHotListUserId = @"userId";


@interface HotList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotList

@synthesize gps = _gps;
@synthesize familyName = _familyName;
@synthesize signatures = _signatures;
@synthesize nationFlag = _nationFlag;
@synthesize starlevel = _starlevel;
@synthesize useridx = _useridx;
@synthesize bigpic = _bigpic;
@synthesize smallpic = _smallpic;
@synthesize isSign = _isSign;
@synthesize myname = _myname;
@synthesize flv = _flv;
@synthesize nation = _nation;
@synthesize roomid = _roomid;
@synthesize curexp = _curexp;
@synthesize allnum = _allnum;
@synthesize pos = _pos;
@synthesize gender = _gender;
@synthesize grade = _grade;
@synthesize level = _level;
@synthesize distance = _distance;
@synthesize serverid = _serverid;
@synthesize userId = _userId;


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
            self.gps = [self objectOrNilForKey:kHotListGps fromDictionary:dict];
            self.familyName = [self objectOrNilForKey:kHotListFamilyName fromDictionary:dict];
            self.signatures = [self objectOrNilForKey:kHotListSignatures fromDictionary:dict];
            self.nationFlag = [self objectOrNilForKey:kHotListNationFlag fromDictionary:dict];
            self.starlevel = [[self objectOrNilForKey:kHotListStarlevel fromDictionary:dict] doubleValue];
            self.useridx = [[self objectOrNilForKey:kHotListUseridx fromDictionary:dict] doubleValue];
            self.bigpic = [self objectOrNilForKey:kHotListBigpic fromDictionary:dict];
            self.smallpic = [self objectOrNilForKey:kHotListSmallpic fromDictionary:dict];
            self.isSign = [[self objectOrNilForKey:kHotListIsSign fromDictionary:dict] doubleValue];
            self.myname = [self objectOrNilForKey:kHotListMyname fromDictionary:dict];
            self.flv = [self objectOrNilForKey:kHotListFlv fromDictionary:dict];
            self.nation = [self objectOrNilForKey:kHotListNation fromDictionary:dict];
            self.roomid = [[self objectOrNilForKey:kHotListRoomid fromDictionary:dict] doubleValue];
            self.curexp = [[self objectOrNilForKey:kHotListCurexp fromDictionary:dict] doubleValue];
            self.allnum = [[self objectOrNilForKey:kHotListAllnum fromDictionary:dict] doubleValue];
            self.pos = [[self objectOrNilForKey:kHotListPos fromDictionary:dict] doubleValue];
            self.gender = [[self objectOrNilForKey:kHotListGender fromDictionary:dict] doubleValue];
            self.grade = [[self objectOrNilForKey:kHotListGrade fromDictionary:dict] doubleValue];
            self.level = [[self objectOrNilForKey:kHotListLevel fromDictionary:dict] doubleValue];
            self.distance = [[self objectOrNilForKey:kHotListDistance fromDictionary:dict] doubleValue];
            self.serverid = [[self objectOrNilForKey:kHotListServerid fromDictionary:dict] doubleValue];
            self.userId = [self objectOrNilForKey:kHotListUserId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.gps forKey:kHotListGps];
    [mutableDict setValue:self.familyName forKey:kHotListFamilyName];
    [mutableDict setValue:self.signatures forKey:kHotListSignatures];
    [mutableDict setValue:self.nationFlag forKey:kHotListNationFlag];
    [mutableDict setValue:[NSNumber numberWithDouble:self.starlevel] forKey:kHotListStarlevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.useridx] forKey:kHotListUseridx];
    [mutableDict setValue:self.bigpic forKey:kHotListBigpic];
    [mutableDict setValue:self.smallpic forKey:kHotListSmallpic];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isSign] forKey:kHotListIsSign];
    [mutableDict setValue:self.myname forKey:kHotListMyname];
    [mutableDict setValue:self.flv forKey:kHotListFlv];
    [mutableDict setValue:self.nation forKey:kHotListNation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.roomid] forKey:kHotListRoomid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.curexp] forKey:kHotListCurexp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.allnum] forKey:kHotListAllnum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pos] forKey:kHotListPos];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gender] forKey:kHotListGender];
    [mutableDict setValue:[NSNumber numberWithDouble:self.grade] forKey:kHotListGrade];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kHotListLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.distance] forKey:kHotListDistance];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverid] forKey:kHotListServerid];
    [mutableDict setValue:self.userId forKey:kHotListUserId];

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

    self.gps = [aDecoder decodeObjectForKey:kHotListGps];
    self.familyName = [aDecoder decodeObjectForKey:kHotListFamilyName];
    self.signatures = [aDecoder decodeObjectForKey:kHotListSignatures];
    self.nationFlag = [aDecoder decodeObjectForKey:kHotListNationFlag];
    self.starlevel = [aDecoder decodeDoubleForKey:kHotListStarlevel];
    self.useridx = [aDecoder decodeDoubleForKey:kHotListUseridx];
    self.bigpic = [aDecoder decodeObjectForKey:kHotListBigpic];
    self.smallpic = [aDecoder decodeObjectForKey:kHotListSmallpic];
    self.isSign = [aDecoder decodeDoubleForKey:kHotListIsSign];
    self.myname = [aDecoder decodeObjectForKey:kHotListMyname];
    self.flv = [aDecoder decodeObjectForKey:kHotListFlv];
    self.nation = [aDecoder decodeObjectForKey:kHotListNation];
    self.roomid = [aDecoder decodeDoubleForKey:kHotListRoomid];
    self.curexp = [aDecoder decodeDoubleForKey:kHotListCurexp];
    self.allnum = [aDecoder decodeDoubleForKey:kHotListAllnum];
    self.pos = [aDecoder decodeDoubleForKey:kHotListPos];
    self.gender = [aDecoder decodeDoubleForKey:kHotListGender];
    self.grade = [aDecoder decodeDoubleForKey:kHotListGrade];
    self.level = [aDecoder decodeDoubleForKey:kHotListLevel];
    self.distance = [aDecoder decodeDoubleForKey:kHotListDistance];
    self.serverid = [aDecoder decodeDoubleForKey:kHotListServerid];
    self.userId = [aDecoder decodeObjectForKey:kHotListUserId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_gps forKey:kHotListGps];
    [aCoder encodeObject:_familyName forKey:kHotListFamilyName];
    [aCoder encodeObject:_signatures forKey:kHotListSignatures];
    [aCoder encodeObject:_nationFlag forKey:kHotListNationFlag];
    [aCoder encodeDouble:_starlevel forKey:kHotListStarlevel];
    [aCoder encodeDouble:_useridx forKey:kHotListUseridx];
    [aCoder encodeObject:_bigpic forKey:kHotListBigpic];
    [aCoder encodeObject:_smallpic forKey:kHotListSmallpic];
    [aCoder encodeDouble:_isSign forKey:kHotListIsSign];
    [aCoder encodeObject:_myname forKey:kHotListMyname];
    [aCoder encodeObject:_flv forKey:kHotListFlv];
    [aCoder encodeObject:_nation forKey:kHotListNation];
    [aCoder encodeDouble:_roomid forKey:kHotListRoomid];
    [aCoder encodeDouble:_curexp forKey:kHotListCurexp];
    [aCoder encodeDouble:_allnum forKey:kHotListAllnum];
    [aCoder encodeDouble:_pos forKey:kHotListPos];
    [aCoder encodeDouble:_gender forKey:kHotListGender];
    [aCoder encodeDouble:_grade forKey:kHotListGrade];
    [aCoder encodeDouble:_level forKey:kHotListLevel];
    [aCoder encodeDouble:_distance forKey:kHotListDistance];
    [aCoder encodeDouble:_serverid forKey:kHotListServerid];
    [aCoder encodeObject:_userId forKey:kHotListUserId];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotList *copy = [[HotList alloc] init];
    
    if (copy) {

        copy.gps = [self.gps copyWithZone:zone];
        copy.familyName = [self.familyName copyWithZone:zone];
        copy.signatures = [self.signatures copyWithZone:zone];
        copy.nationFlag = [self.nationFlag copyWithZone:zone];
        copy.starlevel = self.starlevel;
        copy.useridx = self.useridx;
        copy.bigpic = [self.bigpic copyWithZone:zone];
        copy.smallpic = [self.smallpic copyWithZone:zone];
        copy.isSign = self.isSign;
        copy.myname = [self.myname copyWithZone:zone];
        copy.flv = [self.flv copyWithZone:zone];
        copy.nation = [self.nation copyWithZone:zone];
        copy.roomid = self.roomid;
        copy.curexp = self.curexp;
        copy.allnum = self.allnum;
        copy.pos = self.pos;
        copy.gender = self.gender;
        copy.grade = self.grade;
        copy.level = self.level;
        copy.distance = self.distance;
        copy.serverid = self.serverid;
        copy.userId = [self.userId copyWithZone:zone];
    }
    
    return copy;
}


@end
