//
//  HomeController.m
//  Datefailed
//
//  Created by Code on 17/3/6.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "AdView.h"
#import "HomeController.h"
#import "DataModels.h"
#import "LivePlayController.h"

@interface HomeController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *_preButton;
    NSArray *_dataArray;
    NSArray *_roomListArray;
    
    NSMutableArray *_firstArray;
    NSMutableArray *_secondArray;
    NSMutableArray *_threeArray;
    NSMutableArray *_fourArray;
    NSMutableArray *_fiveArray;

    
}
@property(nonatomic, strong)UIView *navViewZ;//导航栏
@property(nonatomic, strong)UIView *navBottomViewZ;//导航栏下面的放置四个按钮的View
@property(nonatomic, strong)UITableView *tableView;
@property (nonatomic,strong) AdView* adv;//banner图
@property(nonatomic, strong)LivePlayController *livePlaytPage;//直播窗口

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSArray new];
    _roomListArray = [NSArray new];
    
    _firstArray = [NSMutableArray new];
    _secondArray = [NSMutableArray new];
    _threeArray = [NSMutableArray new];
    _fourArray = [NSMutableArray new];
    _fiveArray = [NSMutableArray new];
    
    self.livePlaytPage = [LivePlayController new];
     [self.livePlaytPage setHidesBottomBarWhenPushed:YES];
    [self creatNavView];
    [self creatFourBtnView];
    [self creatMainView];
    [self refreshBanner:self.adv];
    [self doRefresh:YES];
    
    NSLog(@">>>%@",self.tabBarController);


    // Do any additional setup after loading the view.
}
-(void)creatNavView{
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, F_DEVICE_W, F_NAV_Y)];
    navView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.view addSubview:navView];
    self.navViewZ = navView;
    //logo
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, navView.height-40, 30, 30)];
    imageView.image = [UIImage imageNamed:@"userimage"];
    [navView addSubview:imageView];
    
    //观看历史记录的按钮
    UIButton *historyBtn = [[UIButton alloc]initWithFrame:CGRectMake(navView.width-50, 20, 50, 40)];
    historyBtn.tag=100;
    [historyBtn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [historyBtn setImage:[UIImage imageNamed:@"Image_my_history_click"] forState:(UIControlStateNormal)];
    [navView addSubview:historyBtn];
    //搜索
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(historyBtn.left-50, 20, 50, 40)];
    searchBtn.tag=101;
    [searchBtn setImage:[UIImage imageNamed:@"searchIcon"] forState:(UIControlStateNormal)];
    [searchBtn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [navView addSubview:searchBtn];
    //二维码
    UIButton *scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(searchBtn.left-50, 20, 50, 40)];
    scanBtn.tag=102;
    [scanBtn setImage:[UIImage imageNamed:@"Image_scan"] forState:(UIControlStateNormal)];
    [scanBtn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [navView addSubview:scanBtn];
}
//创建导航栏下面的四个按钮
-(void)creatFourBtnView{
    UIView *navbottomView = [[UIView alloc]initWithFrame:CGRectMake(0, self.navViewZ.bottom+gap1, F_DEVICE_W, 30)];
    navbottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navbottomView];
    self.navBottomViewZ = navbottomView;
    
    NSArray *btnName = @[@"推荐",@"游戏",@"娱乐",@"趣玩"];
    
    CGFloat btnWidth = F_DEVICE_W/4;
    CGFloat btnheight = 30;
    //推荐 游戏  娱乐 趣玩
    for (int i=0; i<4; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(btnWidth*i, 0, btnWidth, btnheight)];
        button.tag = 200+i;
        [button setTitle:btnName[i] forState:(UIControlStateNormal)];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [navbottomView addSubview:button];
    }
    
    
}
//创建显示的View
-(void)creatMainView{
    NSLog(@">>>%f",self.navBottomViewZ.bottom);
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.navBottomViewZ.bottom, F_DEVICE_W, F_DEVICE_H-F_NAV_Y-30-F_TAB_BAR_H) style:(UITableViewStylePlain)];
    [self.tableView registerNib:[UINib nibWithNibName:@"BannerCell" bundle:nil] forCellReuseIdentifier:@"BannerCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CommonCell" bundle:nil] forCellReuseIdentifier:@"CommonCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CategoryCell" bundle:nil] forCellReuseIdentifier:@"CategoryCell"];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}
#pragma mark - tableview delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 13;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCell *commentCell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell"];

    if (indexPath.row==0) {
        if (!self.adv) {
            self.adv = [self bannerView];
            [self refreshBanner:self.adv];
        }
        [self.adv removeFromSuperview];
        BannerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BannerCell"];
        [cell.contentView addSubview:self.adv];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }if (indexPath.row==1){
        
    CommonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommonCell"];
        cell.myImageView.image = [UIImage imageNamed:@"home_header_phone"];
        cell.titleLabel.text= @"颜值";
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [cell.channleView assignValue:_firstArray myBlock:^(id userinfo) {
            NSLog(@">>%@",userinfo);
            self.livePlaytPage.flvurl = userinfo;
            [self.navigationController pushViewController:self.livePlaytPage animated:YES];

        }];
        return cell;
    }if (indexPath.row==2){
        commentCell.myImageView.image = [UIImage imageNamed:@"home_header_hot"];
        commentCell.titleLabel.text= @"最热";
        commentCell.bottomView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        commentCell.selectionStyle=UITableViewCellSelectionStyleNone;
        [commentCell.categoryView assignValue:_secondArray myBlock:^(id userinfo) {
            self.livePlaytPage.flvurl = userinfo;
            [self.navigationController pushViewController:self.livePlaytPage animated:YES];
        }];
        return commentCell;
    }if (indexPath.row==3){
        commentCell.myImageView.image = [UIImage imageNamed:@"home_header_normal"];
        commentCell.titleLabel.text= @"我的秀场";
        commentCell.bottomView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        commentCell.selectionStyle=UITableViewCellSelectionStyleNone;
        [commentCell.categoryView assignValue:_threeArray myBlock:^(id userinfo) {
            self.livePlaytPage.flvurl = userinfo;
            [self.navigationController pushViewController:self.livePlaytPage animated:YES];
        }];        return commentCell;
    }if (indexPath.row==4){
        commentCell.myImageView.image = [UIImage imageNamed:@"home_header_normal"];
        commentCell.bottomView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        commentCell.titleLabel.text= @"生活秀";
        commentCell.selectionStyle=UITableViewCellSelectionStyleNone;
        [commentCell.categoryView assignValue:_fiveArray myBlock:^(id userinfo) {
            self.livePlaytPage.flvurl = userinfo;
            [self.navigationController pushViewController:self.livePlaytPage animated:YES];
        }];        return commentCell;
    }if (indexPath.row==5){
        commentCell.myImageView.image = [UIImage imageNamed:@"home_header_normal"];
        commentCell.bottomView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        commentCell.titleLabel.text= @"户外";
        commentCell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        [commentCell.categoryView assignValue:_fourArray myBlock:^(id userinfo) {
            self.livePlaytPage.flvurl = userinfo;
            [self.navigationController pushViewController:self.livePlaytPage animated:YES];
        }];
        return commentCell;
    }if (indexPath.row==6){
        commentCell.myImageView.image = [UIImage imageNamed:@"home_header_normal"];
        commentCell.bottomView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        commentCell.titleLabel.text= @"颜值";
        commentCell.selectionStyle=UITableViewCellSelectionStyleNone;

        return commentCell;
    }if (indexPath.row==7){
        commentCell.myImageView.image = [UIImage imageNamed:@"home_header_normal"];
        commentCell.bottomView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        commentCell.titleLabel.text= @"星秀";
        commentCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return commentCell;
    }if (indexPath.row==8){
        commentCell.myImageView.image = [UIImage imageNamed:@"home_header_normal"];
        commentCell.bottomView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        commentCell.titleLabel.text= @"英雄联盟";
        commentCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return commentCell;
    }if (indexPath.row==9){
        commentCell.myImageView.image = [UIImage imageNamed:@"home_header_normal"];
        commentCell.bottomView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        commentCell.titleLabel.text= @"主机游戏";
        commentCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return commentCell;
    }if (indexPath.row==10){
        commentCell.myImageView.image = [UIImage imageNamed:@"home_header_normal"];
        commentCell.titleLabel.text= @"音乐";
        commentCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return commentCell;
    }if (indexPath.row==11){
        commentCell.myImageView.image = [UIImage imageNamed:@"home_header_normal"];
        commentCell.titleLabel.text= @"梦幻西游手游";
        commentCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return commentCell;
    }if (indexPath.row==12){
        commentCell.myImageView.image = [UIImage imageNamed:@"home_header_normal"];
        commentCell.bottomView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        commentCell.titleLabel.text= @"鱼行天下";
        commentCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return commentCell;
    }else{
        return nil;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return F_DEVICE_W/3;
    }if (indexPath.row==1){
        CGFloat channelWidth = (F_DEVICE_W-3*gap10)/2;
        return 30+(channelWidth+gap10)*2;
    }else{
        CGFloat channelWidth = (F_DEVICE_W-3*gap10)/2;
        return 30+(channelWidth*0.8+gap10)*2;
    }
}
#pragma mark - 触发的点击是事件
-(void)btnClick:(UIButton *)sender{
    _preButton.selected=!_preButton.selected;
    sender.selected=!sender.selected;
    if (sender.tag==100) {
        NSLog(@"观看历史");
    }if (sender.tag==101) {
        NSLog(@"搜索主播");
    }if (sender.tag==102) {
        NSLog(@"二维码扫描");
    }if (sender.tag==200) {
        NSLog(@"推荐");
    }if (sender.tag==201) {
        NSLog(@"游戏");
    }if (sender.tag==202) {
        NSLog(@"娱乐");
    }if (sender.tag==203) {
        NSLog(@"趣玩");
    }
    //记录之前的按钮
    _preButton = sender;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 获取数据
-(void)doRefresh:(BOOL)myboll{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    [manager GET:@"http://live.9158.com/Fans/GetHotLive?page=1" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        HotHot *baseclass = [HotHot modelObjectWithDictionary:responseObject];
        _dataArray = baseclass.data.list;
        
        for (int i=0; i<_dataArray.count; i++) {
            HotList *list = _dataArray[i];
            
            if (i<4) {
                [_firstArray addObject:list];
            }else if (i<8) {
                [_secondArray addObject:list];
            }else if (i<12){
                [_threeArray addObject:list];
            }else if (i<16){
                [_fourArray addObject:list];
            }else{
                [_fiveArray addObject:list];
            }
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
//    [manager GET:@"http://live.9158.com/Fans/GetHotLive?page=1" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@">>>%@",responseObject);
//        HotHot *baseclass = [HotHot modelObjectWithDictionary:responseObject];
//        _dataArray = baseclass.data.list;
//        
//        for (int i=0; i<_dataArray.count; i++) {
//            HotList *list = _dataArray[i];
//            
//            if (i<4) {
//                [_firstArray addObject:list];
//            }else if (i<8) {
//                [_secondArray addObject:list];
//            }else if (i<12){
//                [_threeArray addObject:list];
//            }else if (i<16){
//                [_fourArray addObject:list];
//            }else{
//                [_fiveArray addObject:list];
//            }
//        }
//        [self.tableView reloadData];
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//    }];
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

@implementation UIViewController (adview)

/// 获取banner
-(AdView*) bannerView
{
    return [[AdView alloc] initWithFrame:CGRectMake(0, 0, f_Ad_Content_W, F_DEVICE_W/3)];
}

-(void) refreshBanner:(AdView*)adv
{
    NSArray *array = @[@"boy_no_conten",@"boy_no_conten",@"boy_no_conten",@"boy_no_conten"];
    __weak AdView* bAdv = adv;
    [bAdv startAutoScroll:YES];
    [bAdv refreshWithItem:array callBack:^(id item) {
        
    }];
}
@end


