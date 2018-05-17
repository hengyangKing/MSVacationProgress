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
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[MSVacationProgressMananger shareInstance]showDefaultProgress];
    [[MSVacationProgressMananger shareInstance]willShowProgressBlock:^{
        NSLog(@"will show progress");
    }];
    [[MSVacationProgressMananger shareInstance]switchingScriptBlock:^(NSUInteger index) {
        NSLog(@"switching script index is %@",@(index));
    }];
    [[MSVacationProgressMananger shareInstance]finishProgressBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            MSVacationProgressManagerCurtainConfig *config = [MSVacationProgressManagerCurtainConfig defauteCurtainConfig];
            config.CurtainView([MSVacationProgressCurtainView curtainView]);
            [[MSVacationProgressMananger shareInstance]addCurtainWithConfig:config];
        });
    }];
    
}




@end
