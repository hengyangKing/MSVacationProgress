//
//  TestViewController.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/23.
//  Copyright © 2018年 king. All rights reserved.
//

#import "TestViewController.h"
#import "MSVacationProgressMananger.h"
#import "MSVacationProgressCurtainView.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    /**
     *  设置frame只能控制按钮的大小
     */
    btn.frame= CGRectMake(0, 0, 40, 44);
    [btn addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn_left = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = btn_left;

    
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self show];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[MSVacationProgressMananger shareInstance] dissmiss];
    
}
-(void)buttonClicked{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)show {
    [[MSVacationProgressMananger shareInstance]showDefaultProgressWithFinishBlock:^{
        NSLog(@"finish");
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        [view setBackgroundColor:[UIColor blackColor]];
        [self.view addSubview:view];
    }];
    [[MSVacationProgressMananger shareInstance]willShowProgressBlock:^{
        NSLog(@"will show progress");
    }];
    [[MSVacationProgressMananger shareInstance]switchingScriptBlock:^(NSUInteger index) {
        NSLog(@"switching script index is %@",@(index));
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MSVacationProgressMananger shareInstance].curtainConfig.showCurtainView(YES);
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@",@([MSVacationProgressMananger shareInstance].isLoading));
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        view.backgroundColor = [UIColor redColor];
        [self.view addSubview:view];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        view.backgroundColor = [UIColor greenColor];
        [self.view addSubview:view];
    });
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
