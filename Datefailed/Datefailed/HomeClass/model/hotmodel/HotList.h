//
//  HotList.h
//
//  Created by Code  on 17/3/7
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HotList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *gps;
@property (nonatomic, strong) NSString *familyName;
@property (nonatomic, strong) NSString *signatures;
@property (nonatomic, strong) NSString *nationFlag;
@property (nonatomic, assign) double starlevel;
@property (nonatomic, assign) double useridx;
@property (nonatomic, strong) NSString *bigpic;
@property (nonatomic, strong) NSString *smallpic;
@property (nonatomic, assign) double isSign;
@property (nonatomic, strong) NSString *myname;
@property (nonatomic, strong) NSString *flv;
@property (nonatomic, strong) NSString *nation;
@property (nonatomic, assign) double roomid;
@property (nonatomic, assign) double curexp;
@property (nonatomic, assign) double allnum;
@property (nonatomic, assign) double pos;
@property (nonatomic, assign) double gender;
@property (nonatomic, assign) double grade;
@property (nonatomic, assign) double level;
@property (nonatomic, assign) double distance;
@property (nonatomic, assign) double serverid;
@property (nonatomic, strong) NSString *userId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
