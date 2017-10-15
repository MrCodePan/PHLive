//
//  LiveController.m
//  Datefailed
//
//  Created by Code on 17/3/6.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "LiveController.h"
#import "DataModelsLive.h"
#import "ZFPlayer.h"
#import "MoviePlayerViewController.h"

#define DOU_YOUHTTP @"http://www.douyutv.com/api/v1/home_newbie_list?aid=ios&auth=3c0837ba99e8506db591b7971dfb20c2&client_sys=ios&time="

@interface LiveController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *_dataArray;
}
@property(nonatomic, strong)UICollectionView *collectionView;

@end

@implementation LiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSArray new];
    self.title = @"云调味直播";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatMainView];
    [self doRefresh:YES];
    
    // Do any additional setup after loading the view.
}
-(void)creatMainView{
    CGFloat itemWidth = (F_DEVICE_W-3*gap10)/2;
    CGFloat itemHeight = itemWidth;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 10.f;
//    layout.minimumInteritemSpacing = 10.f;
    
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(gap10, F_NAV_Y, F_DEVICE_W-gap10*2, F_DEVICE_H-F_NAV_Y-F_TAB_BAR_H) collectionViewLayout:layout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LiveModuleCell" bundle:nil]forCellWithReuseIdentifier:@"LiveModuleCell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.view addSubview:self.collectionView];
    
}
#pragma mark - uicollectiondelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;{
    
    LiveModuleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LiveModuleCell" forIndexPath:indexPath];
    LiveData *data = _dataArray[indexPath.row];
    
    /*
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
     */
    
    NSLog(@"%@",data.avatarSmall);
    NSLog(@"%@",data.cateId);
    NSLog(@"%@",data.url);
    NSLog(@"%@",data.nickname);//昵称
    NSLog(@"%@",data.roomSrc);//房间相片
    NSLog(@"%@",data.roomName);//房间名字
    NSLog(@"%@",data.gameUrl);
    NSLog(@"%@",data.jumpUrl);
    NSLog(@"%f",data.online);
    
    [cell assignValue:data];
    
    return cell;
}
-(void)doRefresh:(BOOL)mybool{
    
    NSString *nowUrl = [NSString stringWithFormat:@"%@,%@",DOU_YOUHTTP,[NSString getNowTimes]];
    [[NetworkSingleton sharedManager]postResultWithParameter:nil url:nowUrl successBlock:^(id responseBody) {
        LiveLive *baseClass = [LiveLive modelObjectWithDictionary:responseBody];
        _dataArray = baseClass.data;
        [self.collectionView reloadData];
    } failureBlock:^(NSString *error) {
    }];
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MoviePlayerViewController *tPage = [MoviePlayerViewController new];
    [tPage setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:tPage animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
