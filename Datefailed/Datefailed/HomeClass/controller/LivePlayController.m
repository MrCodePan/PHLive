//
//  LivePlayController.m
//  Datefailed
//
//  Created by Code on 17/3/7.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "LivePlayController.h"
#import "LiveBottomView.h"
#import "BarrageKit.h"

#import <IJKMediaFramework/IJKMediaFramework.h>

@interface LivePlayController ()<BarrageManagerDelegate>
{
    NSMutableArray *_danMuMwssageArray;
}
@property(nonatomic, strong)IJKFFMoviePlayerController *moveController;
@property(nonatomic, strong)LiveBottomView *bottomToolView;//底部工具栏
@property (nonatomic, assign) BOOL hidden;
@property(nonatomic, weak) CAEmitterLayer *emitterLayer;//粒子动画
@property (strong, nonatomic) BarrageManager *manager; //弹幕模块

@end

@implementation LivePlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    //编辑弹幕信息
    _danMuMwssageArray = [[NSMutableArray alloc]initWithObjects:@"主播长得好丑啊",@"6666666666666666",@"6666666666666",@"sb人都没齐就干开团",@"10分钟补了12刀,你TM是我见过最操的adc",@"北9443的6个帅哥",@"1111111111",@"22222222222",@"主播太菜了",@"白银水平的也好意思开直播",@"斗鱼三骚--平胸mini",@"图书馆是世界还上最空恐怖的地方",@"考第一名有意义吗",@"这主播绝对是个sb",@"玩直播LOL我就撤了",@"关注走一波",nil];
    
    

    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view addSubview:[self player].view];
    [self bottomToolView];
    [self emitterLayer];//弹花
    [self showDanMu];

}
-(void)showDanMu{
    _manager = [BarrageManager manager];
    
    //出现的View
    _manager.bindingView = self.moveController.view;
    
    //delegate
    _manager.delegate = self;
    
    //弹幕显示位置
    _manager.displayLocation = BarrageDisplayLocationTypeCenter;
    
    //滚动方向
    _manager.scrollDirection = BarrageScrollDirectLeftToRight;
    
    //滚动速度
    _manager.scrollSpeed = 30;
    
    //收到内存警告的处理方式
    _manager.memoryMode = BarrageMemoryWarningModeHalf;
    
    //刷新时间
    _manager.refreshInterval = 1.0;
    
    //开始滚动 manager主动获取弹幕，另外一种方式，`[_manager showBarrageWithDataSource:m]` 退出弹幕即可
    [_manager startScroll];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    _moveController=nil;
}
-(IJKFFMoviePlayerController *)player{
    if (!_moveController) {
        
        IJKFFOptions *options = [IJKFFOptions optionsByDefault];
        [options setPlayerOptionIntValue:1  forKey:@"videotoolbox"];
        
        // 帧速率(fps) （可以改，确认非标准桢率会导致音画不同步，所以只能设定为15或者29.97）
        [options setPlayerOptionIntValue:29.97 forKey:@"r"];
        // -vol——设置音量大小，256为标准音量。（要设置成两倍音量时则输入512，依此类推
        [options setPlayerOptionIntValue:512 forKey:@"vol"];
        
        _moveController = [[IJKFFMoviePlayerController alloc]initWithContentURLString:self.flvurl withOptions:options];
        [_moveController prepareToPlay];
        [self initObserver];
        _moveController.scalingMode = IJKMPMovieScalingModeAspectFill;
        // 设置自动播放(必须设置为NO, 防止自动播放, 才能更好的控制直播的状态)
        _moveController.shouldAutoplay = NO;
        
        _moveController.view.backgroundColor = [UIColor whiteColor];
        _moveController.view.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    }
    
    return _moveController;
}

- (void)initObserver
{
    [self.moveController play];
    _emitterLayer.hidden=NO;

    //    // 监听视频是否播放完成
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinish) name:IJKMPMoviePlayerPlaybackDidFinishNotification object:self.moveController];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stateDidChange) name:IJKMPMoviePlayerLoadStateDidChangeNotification object:self.moveController];
}
-(void)didFinish{
    NSLog(@"播放完成");
    
}
-(void)stateDidChange{
    
}

- (LiveBottomView *)bottomToolView
{
    if (_bottomToolView == nil) {
        
        self.hidden = NO;
        
        LiveBottomView *bottomToolView = [[LiveBottomView alloc] init];
        
        __weak typeof(self) weakSekf = self;
        [bottomToolView setClickToolBlock:^(NSInteger tag) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"开启字母将会导致画面和声音不同步" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否隐藏旋转主播列表" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否向该主播送100万美金" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertController *alert3 = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否隐藏猫耳窗口" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                weakSekf.hidden = !weakSekf.hidden;
//                weakSekf.hidden ? [_renderer start] : [_renderer stop];
                
                
            }];
            
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
//                for (UIView *view in weakSekf.anchorView.subviews) {
//                    
//                    if ([view isKindOfClass:[UIScrollView class]]){
//                        
//                        [UIView animateWithDuration:1 animations:^{
//                            
//                            view.alpha = 0;
//                        }];
//                        
//                    }
//                }
                
                
            }];
            
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [MBProgressHUD showSuccess:@"已从你账号中扣除"];
                
            }];
            UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [UIView animateWithDuration:1 animations:^{
                    
//                    weakSekf.catEarView.alpha = 0;
                }];
                
                
            }];
            
            UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                
                return;
            }];
            
            [alert addAction:cancle];
            [alert addAction:action];
            [alert1 addAction:cancle];
            [alert1 addAction:action1];
            [alert2 addAction:cancle];
            [alert2 addAction:action2];
            [alert3 addAction:cancle];
            [alert3 addAction:action3];
            
            switch (tag) {
                case 0:
                    
                    if (self.hidden){
                        
                        self.hidden = !self.hidden;
//                        [_renderer stop];
                        
                        return;
                    }
                    
                    [self presentViewController:alert animated:YES completion:nil];
                    
                    break;
                case 1:
                    
                    
//                    for (UIView *view in weakSekf.anchorView.subviews) {
//                        
//                        if ([view isKindOfClass:[UIScrollView class]]){
//                            
//                            if (view.alpha == 0){
//                                
//                                [UIView animateWithDuration:1 animations:^{
//                                    
//                                    
//                                    view.alpha = 1;
//                                    
//                                }];
//                                
//                                return;
//                            }
//                        }
//                    }
                    
                    
                    [self presentViewController:alert1 animated:YES completion:nil];
                    break;
                    
                case 2:
                    
                    [self presentViewController:alert2 animated:YES completion:nil];
                    break;
                    
                case 3:
                    
//                    if (self.catEarView.alpha == 0){
//                        
//                        [UIView animateWithDuration:1 animations:^{
//                            
//                            self.catEarView.alpha = 1;
//                        }];
//                        
//                        return;
//                    }
//                    
//                    [self presentViewController:alert3 animated:YES completion:nil];
                    break;
                case 4:
                    
//                    [self shareMethod];
                    break;
                    
                case 5:
                    
                    [self quit];
                    
                    break;
                default:
                    break;
            }
        }];
        
        
        [self.view addSubview:bottomToolView];
        
        bottomToolView.frame = CGRectMake(0, F_DEVICE_H-60, F_DEVICE_W, 40);
        
        _bottomToolView = bottomToolView;
    }
    return _bottomToolView;
}

- (CAEmitterLayer *)emitterLayer
{
    
    if (!_emitterLayer) {
        CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
        // 发射器在xy平面的中心位置
        emitterLayer.emitterPosition = CGPointMake(self.view.frame.size.width-50,self.view.frame.size.height-50);
        // 发射器的尺寸大小
        emitterLayer.emitterSize = CGSizeMake(20, 20);
        // 渲染模式
        emitterLayer.renderMode = kCAEmitterLayerUnordered;
        // 开启三维效果
        //    _emitterLayer.preservesDepth = YES;
        NSMutableArray *array = [NSMutableArray array];
        // 创建粒子
        for (int i = 0; i<10; i++) {
            // 发射单元
            CAEmitterCell *stepCell = [CAEmitterCell emitterCell];
            // 粒子的创建速率，默认为1/s
            stepCell.birthRate = 1;
            // 粒子存活时间
            stepCell.lifetime = arc4random_uniform(4) + 1;
            // 粒子的生存时间容差
            stepCell.lifetimeRange = 1.5;
            // 颜色
            // fire.color=[[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1]CGColor];
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"good%d_30x30", i]];
            // 粒子显示的内容
            stepCell.contents = (id)[image CGImage];
            // 粒子的名字
            //            [fire setName:@"step%d", i];
            // 粒子的运动速度
            stepCell.velocity = arc4random_uniform(100) + 100;
            // 粒子速度的容差
            stepCell.velocityRange = 80;
            // 粒子在xy平面的发射角度
            stepCell.emissionLongitude = M_PI+M_PI_2;;
            // 粒子发射角度的容差
            stepCell.emissionRange = M_PI_2/6;
            // 缩放比例
            stepCell.scale = 0.3;
            [array addObject:stepCell];
        }
        [self.view.layer addSublayer:emitterLayer];
        emitterLayer.emitterCells = array;
        _emitterLayer = emitterLayer;
    }
    return _emitterLayer;
}



//结束播放
-(void)quit{
    
    if (_bottomToolView){
        
        [_bottomToolView removeFromSuperview];
        _bottomToolView = nil;
    }
    if (_emitterLayer) {
        [_emitterLayer removeFromSuperlayer];
        _emitterLayer=nil;
    }
    
    if (_moveController) {
        
        [self.moveController pause];
        [self.moveController stop];
        [self.moveController shutdown];
        [self.moveController.view removeFromSuperview];
        self.moveController = nil;
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    [self.navigationController popViewControllerAnimated:NO];
}
#pragma mark - 弹幕delegate
#pragma mark - BarrageManagerDelegate
- (id)barrageManagerDataSource {
    
    //弹幕方向
    _manager.scrollDirection = BarrageScrollDirectRightToLeft;
    
    
    
    NSInteger danmuCount = _danMuMwssageArray.count-1;
    
    //生成弹幕信息
    int a = arc4random() % danmuCount;
    NSString *str = _danMuMwssageArray[a];
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str];
    [attr addAttribute:NSForegroundColorAttributeName value:RandomColor() range:NSMakeRange(0, str.length)];
    
    BarrageModel *m = [[BarrageModel alloc] initWithBarrageContent:attr];
    m.displayLocation = BarrageDisplayLocationTypeCenter;
    m.barrageType = BarrageDisplayTypeDefault;
    return m;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
UIColor * RandomColor() {
    float a = (arc4random() % 255) / 255.0;
    float b = (arc4random() % 255) / 255.0;
    float c = (arc4random() % 255) / 255.0;
    
    return [UIColor colorWithRed:a green:b blue:c alpha:1.0];

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
