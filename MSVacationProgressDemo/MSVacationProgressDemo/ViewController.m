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
    [self.view setBackgroundColor:[UIColor redColor]];
    MSVacationProgressCurtainView *fooview = [MSVacationProgressCurtainView curtainView];
    [self.view addSubview:fooview];
    [fooview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(self.view);
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[MSVacationProgressMananger shareInstance]showDefaultProgressWithFinishBlock:^{
        NSLog(@"finish");
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
    
}




@end
