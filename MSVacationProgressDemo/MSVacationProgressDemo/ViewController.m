//
//  ViewController.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "ViewController.h"
#import "MSVacationProgressView.h"
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
        make.centerY.mas_equalTo(self.view);
        make.leading.mas_equalTo(self.view).mas_offset(14);
        make.trailing.mas_equalTo(self.view).mas_offset(-14);

        make.height.mas_equalTo(5);
    }];
    NSLog(@"123");
    


}



- (nullable NSArray<MSVacationProgressScript *> *)scriptsForMSVacationProgressView:(MSVacationProgressView *)view {
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i++ ; i<10) {
        NSString *str = [NSString stringWithFormat:@"%@",@(i)];
        MSVacationProgressScript *script = [MSVacationProgressScript progressScriptWithTitle:str andSubTitle:str andTimeInterval:i+0.5];
        [array addObject:script];
    }
    return array;
}




@end
