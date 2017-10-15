//
//  LiveModuleCell.h
//  Datefailed
//
//  Created by Code on 17/3/8.
//  Copyright © 2017年 Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModelsLive.h"

@interface LiveModuleCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userIamgeView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userMainName;
@property (weak, nonatomic) IBOutlet UIImageView *sureImage;
@property (weak, nonatomic) IBOutlet UILabel *roomName;
-(void)assignValue:(LiveData *)data;

@end
