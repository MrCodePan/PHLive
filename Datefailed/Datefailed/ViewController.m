//
//  ViewController.m
//  Datefailed
//
//  Created by Code on 17/3/6.
//  Copyright © 2017年 Code. All rights reserved.
//

#import "ViewController.h"
#import "FirstPage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)sss{
    
}

-(void)sss:(NSString *)name{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    FirstPage *page = [[FirstPage alloc]initWithNibName:@"FirstPage" bundle:nil];
    
    [self presentViewController:page animated:YES completion:nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
