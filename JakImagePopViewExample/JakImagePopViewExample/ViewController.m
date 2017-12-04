//
//  ViewController.m
//  JakImagePopViewExample
//
//  Created by Zyh on 2017/12/4.
//  Copyright © 2017年 Jak. All rights reserved.
//

#import "ViewController.h"
#import "JakImagePopView.h"

@interface ViewController ()<JakImagePopViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 20)];
    [btn setTitle:@"弹出视图" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showJakImagePopView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}




-(void)showJakImagePopView{
    
    JakImagePopView *jakImagePopView = [[JakImagePopView alloc]initWithParentView:self.view];
    jakImagePopView.delegate = self;
    [jakImagePopView showWithTitle:@"弹出来看看" Image:[UIImage imageNamed:@"test"]];
    
}

#pragma mark --  JakImagePopViewDelegate

-(void)OKBtnClicked;
{
    NSLog(@"OKBtnClicked");
}

-(void)CancleBtnClicked;
{
    NSLog(@"CancleBtnClicked");
}


@end
