//
//  ViewController.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "ViewController.h"
#import "MSVacationProgress.h"
@interface ViewController ()
@property(nonatomic,strong)MSVacationProgress *progress;
@end

@implementation ViewController
-(MSVacationProgress *)progress
{
    if (!_progress) {
        _progress = [MSVacationProgress MSVacationProgressWithConfig:^(MSVacationProgressAppearanceConfig *config) {
            
        }];
    }
    return _progress;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //测试进度条
    
    [self.view addSubview:self.progress];
    [self.progress mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view);
        make.leading.mas_equalTo(self.view).mas_offset(14);
        make.trailing.mas_equalTo(self.view).mas_offset(-14);

        make.height.mas_equalTo(5);
    }];
    NSLog(@"123");
    


}
-(void)foo{
    [self.progress setProgress:foo andInterval:1.5f animatedFinish:^{
        NSLog(@"finish");
        foo+=0.333333333333333333;
    }];
}
static CGFloat foo = 0.333333333333333333f;


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
