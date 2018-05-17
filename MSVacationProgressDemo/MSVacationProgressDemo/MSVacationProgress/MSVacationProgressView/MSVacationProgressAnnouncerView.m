//
//  MSVacationProgressAnnouncerView.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "MSVacationProgressAnnouncerView.h"
#import "MSVacationProgressViewAppearanceConfig.h"
#import "MSVacationProgressScript.h"
#import "Masonry.h"

@interface MSVacationProgressAnnouncerView()
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *subTitle;
@property(nonatomic,strong)MSVacationProgressViewAppearanceConfig *config;
@property(nonatomic,strong)MSVacationProgressScript *data;
@end
@implementation MSVacationProgressAnnouncerView
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
+(NSString *)identifier {
    return [NSString stringWithFormat:@"%@ID",NSStringFromClass(self)];
}
#pragma mark get
-(void (^)(MSVacationProgressScript *))Script {
    return ^(MSVacationProgressScript *script){
        self.data = script;
    };
}
-(void (^)(MSVacationProgressViewAppearanceConfig *))AppearanceConfig {
    return ^(MSVacationProgressViewAppearanceConfig *config){
        self.config = config;
    };
}
-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc]init];
        [_title setTextAlignment:(NSTextAlignmentCenter)];
        _title.numberOfLines = 0;
    }
    return _title;
}
-(UILabel *)subTitle {
    if (!_subTitle) {
        _subTitle = [[UILabel alloc]init];
        [_subTitle setTextAlignment:(NSTextAlignmentCenter)];
        _subTitle.numberOfLines = 0;
    }
    return _subTitle;
}
#pragma mark set
-(void)setData:(MSVacationProgressScript *)data {
    _data = data;
    [self.title setText:_data.content.title];
    [self.subTitle setText:_data.content.subTitlt];
}
-(void)setConfig:(MSVacationProgressViewAppearanceConfig *)config {
    _config = config;
    [self.title setTextColor:_config.titleColor];
    [self.subTitle setTextColor:_config.subTitleColor];
    [self.title setFont:_config.titleFont];
    [self.subTitle setFont:_config.subTitleFont];
}
#pragma mark func
-(void)createUI {
    [self addSubview:self.title];
    [self addSubview:self.subTitle];
    __weak typeof(self) weakself = self;
    [self.title mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(weakself);
        make.height.mas_equalTo(30);
        make.bottom.mas_equalTo(weakself.subTitle.mas_top).mas_offset(-5);
    }];
    [self.subTitle mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(weakself);
        make.height.mas_equalTo(25);
    }];
}


@end
