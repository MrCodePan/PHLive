//
//  LiveData.m
//
//  Created by Code  on 17/3/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LiveData.h"
#import "LiveIconData.h"


NSString *const kLiveDataAvatarSmall = @"avatar_small";
NSString *const kLiveDataCateId = @"cate_id";
NSString *const kLiveDataVerticalSrc = @"vertical_src";
NSString *const kLiveDataUrl = @"url";
NSString *const kLiveDataNickname = @"nickname";
NSString *const kLiveDataRoomSrc = @"room_src";
NSString *const kLiveDataSubject = @"subject";
NSString *const kLiveDataIsVertical = @"isVertical";
NSString *const kLiveDataAvatarMid = @"avatar_mid";
NSString *const kLiveDataRoomName = @"room_name";
NSString *const kLiveDataSpecificCatalog = @"specific_catalog";
NSString *const kLiveDataGameName = @"game_name";
NSString *const kLiveDataJumpUrl = @"jumpUrl";
NSString *const kLiveDataShowTime = @"show_time";
NSString *const kLiveDataIconData = @"icon_data";
NSString *const kLiveDataChildId = @"child_id";
NSString *const kLiveDataShowStatus = @"show_status";
NSString *const kLiveDataAvatar = @"avatar";
NSString *const kLiveDataGameUrl = @"game_url";
NSString *const kLiveDataRoomId = @"room_id";
NSString *const kLiveDataOwnerUid = @"owner_uid";
NSString *const kLiveDataVodQuality = @"vod_quality";
NSString *const kLiveDataOnline = @"online";
NSString *const kLiveDataSpecificStatus = @"specific_status";


@interface LiveData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LiveData

@synthesize avatarSmall = _avatarSmall;
@synthesize cateId = _cateId;
@synthesize verticalSrc = _verticalSrc;
@synthesize url = _url;
@synthesize nickname = _nickname;
@synthesize roomSrc = _roomSrc;
@synthesize subject = _subject;
@synthesize isVertical = _isVertical;
@synthesize avatarMid = _avatarMid;
@synthesize roomName = _roomName;
@synthesize specificCatalog = _specificCatalog;
@synthesize gameName = _gameName;
@synthesize jumpUrl = _jumpUrl;
@synthesize showTime = _showTime;
@synthesize iconData = _iconData;
@synthesize childId = _childId;
@synthesize showStatus = _showStatus;
@synthesize avatar = _avatar;
@synthesize gameUrl = _gameUrl;
@synthesize roomId = _roomId;
@synthesize ownerUid = _ownerUid;
@synthesize vodQuality = _vodQuality;
@synthesize online = _online;
@synthesize specificStatus = _specificStatus;


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
            self.avatarSmall = [self objectOrNilForKey:kLiveDataAvatarSmall fromDictionary:dict];
            self.cateId = [self objectOrNilForKey:kLiveDataCateId fromDictionary:dict];
            self.verticalSrc = [self objectOrNilForKey:kLiveDataVerticalSrc fromDictionary:dict];
            self.url = [self objectOrNilForKey:kLiveDataUrl fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kLiveDataNickname fromDictionary:dict];
            self.roomSrc = [self objectOrNilForKey:kLiveDataRoomSrc fromDictionary:dict];
            self.subject = [self objectOrNilForKey:kLiveDataSubject fromDictionary:dict];
            self.isVertical = [[self objectOrNilForKey:kLiveDataIsVertical fromDictionary:dict] doubleValue];
            self.avatarMid = [self objectOrNilForKey:kLiveDataAvatarMid fromDictionary:dict];
            self.roomName = [self objectOrNilForKey:kLiveDataRoomName fromDictionary:dict];
            self.specificCatalog = [self objectOrNilForKey:kLiveDataSpecificCatalog fromDictionary:dict];
            self.gameName = [self objectOrNilForKey:kLiveDataGameName fromDictionary:dict];
            self.jumpUrl = [self objectOrNilForKey:kLiveDataJumpUrl fromDictionary:dict];
            self.showTime = [self objectOrNilForKey:kLiveDataShowTime fromDictionary:dict];
            self.iconData = [LiveIconData modelObjectWithDictionary:[dict objectForKey:kLiveDataIconData]];
            self.childId = [self objectOrNilForKey:kLiveDataChildId fromDictionary:dict];
            self.showStatus = [self objectOrNilForKey:kLiveDataShowStatus fromDictionary:dict];
            self.avatar = [self objectOrNilForKey:kLiveDataAvatar fromDictionary:dict];
            self.gameUrl = [self objectOrNilForKey:kLiveDataGameUrl fromDictionary:dict];
            self.roomId = [self objectOrNilForKey:kLiveDataRoomId fromDictionary:dict];
            self.ownerUid = [self objectOrNilForKey:kLiveDataOwnerUid fromDictionary:dict];
            self.vodQuality = [self objectOrNilForKey:kLiveDataVodQuality fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kLiveDataOnline fromDictionary:dict] doubleValue];
            self.specificStatus = [self objectOrNilForKey:kLiveDataSpecificStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.avatarSmall forKey:kLiveDataAvatarSmall];
    [mutableDict setValue:self.cateId forKey:kLiveDataCateId];
    [mutableDict setValue:self.verticalSrc forKey:kLiveDataVerticalSrc];
    [mutableDict setValue:self.url forKey:kLiveDataUrl];
    [mutableDict setValue:self.nickname forKey:kLiveDataNickname];
    [mutableDict setValue:self.roomSrc forKey:kLiveDataRoomSrc];
    [mutableDict setValue:self.subject forKey:kLiveDataSubject];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isVertical] forKey:kLiveDataIsVertical];
    [mutableDict setValue:self.avatarMid forKey:kLiveDataAvatarMid];
    [mutableDict setValue:self.roomName forKey:kLiveDataRoomName];
    [mutableDict setValue:self.specificCatalog forKey:kLiveDataSpecificCatalog];
    [mutableDict setValue:self.gameName forKey:kLiveDataGameName];
    [mutableDict setValue:self.jumpUrl forKey:kLiveDataJumpUrl];
    [mutableDict setValue:self.showTime forKey:kLiveDataShowTime];
    [mutableDict setValue:[self.iconData dictionaryRepresentation] forKey:kLiveDataIconData];
    [mutableDict setValue:self.childId forKey:kLiveDataChildId];
    [mutableDict setValue:self.showStatus forKey:kLiveDataShowStatus];
    [mutableDict setValue:self.avatar forKey:kLiveDataAvatar];
    [mutableDict setValue:self.gameUrl forKey:kLiveDataGameUrl];
    [mutableDict setValue:self.roomId forKey:kLiveDataRoomId];
    [mutableDict setValue:self.ownerUid forKey:kLiveDataOwnerUid];
    [mutableDict setValue:self.vodQuality forKey:kLiveDataVodQuality];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kLiveDataOnline];
    [mutableDict setValue:self.specificStatus forKey:kLiveDataSpecificStatus];

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

    self.avatarSmall = [aDecoder decodeObjectForKey:kLiveDataAvatarSmall];
    self.cateId = [aDecoder decodeObjectForKey:kLiveDataCateId];
    self.verticalSrc = [aDecoder decodeObjectForKey:kLiveDataVerticalSrc];
    self.url = [aDecoder decodeObjectForKey:kLiveDataUrl];
    self.nickname = [aDecoder decodeObjectForKey:kLiveDataNickname];
    self.roomSrc = [aDecoder decodeObjectForKey:kLiveDataRoomSrc];
    self.subject = [aDecoder decodeObjectForKey:kLiveDataSubject];
    self.isVertical = [aDecoder decodeDoubleForKey:kLiveDataIsVertical];
    self.avatarMid = [aDecoder decodeObjectForKey:kLiveDataAvatarMid];
    self.roomName = [aDecoder decodeObjectForKey:kLiveDataRoomName];
    self.specificCatalog = [aDecoder decodeObjectForKey:kLiveDataSpecificCatalog];
    self.gameName = [aDecoder decodeObjectForKey:kLiveDataGameName];
    self.jumpUrl = [aDecoder decodeObjectForKey:kLiveDataJumpUrl];
    self.showTime = [aDecoder decodeObjectForKey:kLiveDataShowTime];
    self.iconData = [aDecoder decodeObjectForKey:kLiveDataIconData];
    self.childId = [aDecoder decodeObjectForKey:kLiveDataChildId];
    self.showStatus = [aDecoder decodeObjectForKey:kLiveDataShowStatus];
    self.avatar = [aDecoder decodeObjectForKey:kLiveDataAvatar];
    self.gameUrl = [aDecoder decodeObjectForKey:kLiveDataGameUrl];
    self.roomId = [aDecoder decodeObjectForKey:kLiveDataRoomId];
    self.ownerUid = [aDecoder decodeObjectForKey:kLiveDataOwnerUid];
    self.vodQuality = [aDecoder decodeObjectForKey:kLiveDataVodQuality];
    self.online = [aDecoder decodeDoubleForKey:kLiveDataOnline];
    self.specificStatus = [aDecoder decodeObjectForKey:kLiveDataSpecificStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_avatarSmall forKey:kLiveDataAvatarSmall];
    [aCoder encodeObject:_cateId forKey:kLiveDataCateId];
    [aCoder encodeObject:_verticalSrc forKey:kLiveDataVerticalSrc];
    [aCoder encodeObject:_url forKey:kLiveDataUrl];
    [aCoder encodeObject:_nickname forKey:kLiveDataNickname];
    [aCoder encodeObject:_roomSrc forKey:kLiveDataRoomSrc];
    [aCoder encodeObject:_subject forKey:kLiveDataSubject];
    [aCoder encodeDouble:_isVertical forKey:kLiveDataIsVertical];
    [aCoder encodeObject:_avatarMid forKey:kLiveDataAvatarMid];
    [aCoder encodeObject:_roomName forKey:kLiveDataRoomName];
    [aCoder encodeObject:_specificCatalog forKey:kLiveDataSpecificCatalog];
    [aCoder encodeObject:_gameName forKey:kLiveDataGameName];
    [aCoder encodeObject:_jumpUrl forKey:kLiveDataJumpUrl];
    [aCoder encodeObject:_showTime forKey:kLiveDataShowTime];
    [aCoder encodeObject:_iconData forKey:kLiveDataIconData];
    [aCoder encodeObject:_childId forKey:kLiveDataChildId];
    [aCoder encodeObject:_showStatus forKey:kLiveDataShowStatus];
    [aCoder encodeObject:_avatar forKey:kLiveDataAvatar];
    [aCoder encodeObject:_gameUrl forKey:kLiveDataGameUrl];
    [aCoder encodeObject:_roomId forKey:kLiveDataRoomId];
    [aCoder encodeObject:_ownerUid forKey:kLiveDataOwnerUid];
    [aCoder encodeObject:_vodQuality forKey:kLiveDataVodQuality];
    [aCoder encodeDouble:_online forKey:kLiveDataOnline];
    [aCoder encodeObject:_specificStatus forKey:kLiveDataSpecificStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    LiveData *copy = [[LiveData alloc] init];
    
    if (copy) {

        copy.avatarSmall = [self.avatarSmall copyWithZone:zone];
        copy.cateId = [self.cateId copyWithZone:zone];
        copy.verticalSrc = [self.verticalSrc copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.roomSrc = [self.roomSrc copyWithZone:zone];
        copy.subject = [self.subject copyWithZone:zone];
        copy.isVertical = self.isVertical;
        copy.avatarMid = [self.avatarMid copyWithZone:zone];
        copy.roomName = [self.roomName copyWithZone:zone];
        copy.specificCatalog = [self.specificCatalog copyWithZone:zone];
        copy.gameName = [self.gameName copyWithZone:zone];
        copy.jumpUrl = [self.jumpUrl copyWithZone:zone];
        copy.showTime = [self.showTime copyWithZone:zone];
        copy.iconData = [self.iconData copyWithZone:zone];
        copy.childId = [self.childId copyWithZone:zone];
        copy.showStatus = [self.showStatus copyWithZone:zone];
        copy.avatar = [self.avatar copyWithZone:zone];
        copy.gameUrl = [self.gameUrl copyWithZone:zone];
        copy.roomId = [self.roomId copyWithZone:zone];
        copy.ownerUid = [self.ownerUid copyWithZone:zone];
        copy.vodQuality = [self.vodQuality copyWithZone:zone];
        copy.online = self.online;
        copy.specificStatus = [self.specificStatus copyWithZone:zone];
    }
    
    return copy;
}


@end
