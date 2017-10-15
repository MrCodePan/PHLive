//
//  BaseClassController.m
//  PHReading
//
//  Created by Code on 17/2/14.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "BaseClassController.h"

@interface BaseClassController ()<TitleBarProtocol>

@end

@implementation BaseClassController
-(void) loadView
{
    [super loadView];
    self.view.backgroundColor = COLOR_BG;
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//标题
-(void) setTitle:(NSString *)title
{
    [self.titleBar label:title];
}

-(TitleBar*)titleBar
{
    if (!_titleBar) {
        _titleBar = [TitleBar titleBarWithHeight:f_Title_h delegate:self];
        [_titleBar left:nil btnImg:@"b_title_back"];
        [self.view addSubview:_titleBar];
    }
    return _titleBar;
}
-(void) titleBtnClick:(UIButton *)button
{
    NSInteger tag = [button tag];
    if (tag == i_Title_Btn_Left) {
        [self close];
    }
}
/// 关闭页面
-(void) close
{
    if (self.fromPUSH) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
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
