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
    
    [[MSVacationProgressMananger shareInstance] finishProgressBlock:^MSVacationProgressManagerCurtainConfig *(MSVacationProgressManagerCurtainConfig *config) {
        NSLog(@"finish Progress Block");
        config.CurtainView([MSVacationProgressCurtainView curtainView]);
        return config;
    }];
}




@end
