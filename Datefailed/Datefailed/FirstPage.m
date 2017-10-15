//
//  FirstPage.m
//  Datefailed
//
//  Created by 潘恒 on 2017/6/13.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "FirstPage.h"
#import "FirstCell.h"

@interface FirstPage ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FirstPage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.backgroundColor = [UIColor magentaColor];
    

    
    
    
    // Do any additional setup after loading the view from its nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.firstView.frame = CGRectMake(0, 31, F_DEVICE_W, 100);
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130+50;
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
