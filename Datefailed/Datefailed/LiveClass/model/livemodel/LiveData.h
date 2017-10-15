//
//  LiveData.h
//
//  Created by Code  on 17/3/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LiveIconData;

@interface LiveData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *avatarSmall;
@property (nonatomic, strong) NSString *cateId;
@property (nonatomic, strong) NSString *verticalSrc;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *roomSrc;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, assign) double isVertical;
@property (nonatomic, strong) NSString *avatarMid;
@property (nonatomic, strong) NSString *roomName;
@property (nonatomic, strong) NSString *specificCatalog;
@property (nonatomic, strong) NSString *gameName;
@property (nonatomic, strong) NSString *jumpUrl;
@property (nonatomic, strong) NSString *showTime;
@property (nonatomic, strong) LiveIconData *iconData;
@property (nonatomic, strong) NSString *childId;
@property (nonatomic, strong) NSString *showStatus;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *gameUrl;
@property (nonatomic, strong) NSString *roomId;
@property (nonatomic, strong) NSString *ownerUid;
@property (nonatomic, strong) NSString *vodQuality;
@property (nonatomic, assign) double online;
@property (nonatomic, strong) NSString *specificStatus;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
