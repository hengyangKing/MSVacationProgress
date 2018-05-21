//
//  ViewController.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "ViewController.h"
#import "MSVacationProgressMananger.h"
#import "MSVacationProgressCurtainView.h"
#import "Masonry.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
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




@end
