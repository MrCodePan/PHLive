//
//  CategoryCell.h
//  Datefailed
//
//  Created by Code on 17/3/6.
//  Copyright © 2017年 Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryView.h"

@interface CategoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (strong, nonatomic)CategoryView *categoryView;

@end
