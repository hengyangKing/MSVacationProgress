//
//  ViewController.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "ViewController.h"
#import "MSVacationProgressView.h"
//#import "MSVacationProgressScript.h"
#import "Masonry.h"
@interface ViewController ()<MSVacationProgressViewDelegate,MSVacationProgressViewDataSorce>
@property(nonatomic,strong)MSVacationProgressView *progress;
@end

@implementation ViewController
-(MSVacationProgressView *)progress {
    if (!_progress) {
        _progress = [MSVacationProgressView createWithAppearanceConfig:^(MSVacationProgressViewAppearanceConfig *config) {
            
        }];
        _progress.delegate = self;
        _progress.dataSource = self;
    }
    return _progress;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //测试进度条
    
    [self.view addSubview:self.progress];
    [self.progress mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
    NSLog(@"123");
    
    [self.progress show];

}



- (nullable NSArray<MSVacationProgressScript *> *)scriptsForMSVacationProgressView:(MSVacationProgressView *)view {
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i<3 ; i++) {
        NSString *str = [NSString stringWithFormat:@"%@",@(i)];
        MSVacationProgressScript *script = [MSVacationProgressScript progressScriptWithTitle:str andSubTitle:str andTimeInterval:1.5];
        [array addObject:script];
    }
    return array;
}




@end
