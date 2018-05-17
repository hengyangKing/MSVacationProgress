//
//  MSVacationProgressCurtainView.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "MSVacationProgressCurtainView.h"
#import "Masonry.h"
#define CurtainFONT(A) [UIFont fontWithName:@"PingFangSC-Regular"size:A]?[UIFont fontWithName:@"PingFangSC-Regular"size:A]:[UIFont systemFontOfSize:A]
#define ProgressRGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

@interface MSVacationProgressCurtainView()
@property(nonatomic,strong)UIImageView *cover;
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *subTitle;

@end
@implementation MSVacationProgressCurtainView

+(instancetype)curtainView {
    MSVacationProgressCurtainView *view = [[MSVacationProgressCurtainView alloc]init];
    [view createUI];
    return view;
}

-(UIImageView *)cover
{
    if (!_cover) {
        _cover = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ms_progress_curtain"]];
        [_cover sizeToFit];
    }
    return _cover;
}
-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc]initWithFrame:CGRectZero];
        [_title setTextAlignment:(NSTextAlignmentCenter)];
        [_title setFont:CurtainFONT(17)];
        [_title setTextColor:ProgressRGB(51, 51, 51)];
        [_title setText:@"准备完毕"];
        [_title sizeToFit];
    }
    return _title;
}
-(UILabel *)subTitle
{
    if (!_subTitle) {
        _subTitle = [[UILabel alloc]initWithFrame:CGRectZero];
        [_subTitle setTextAlignment:(NSTextAlignmentCenter)];
        [_subTitle setFont:CurtainFONT(14)];
        [_subTitle setTextColor:ProgressRGB(144, 150, 158)];
        [_subTitle setText:@"已为您的全部学生准备了个性化暑假作业"];
        [_subTitle sizeToFit];

    }
    return _subTitle;
}
-(void)createUI {
    [self setBackgroundColor:[UIColor whiteColor]];

    [self addSubview:self.cover];
    [self addSubview:self.title];
    [self addSubview:self.subTitle];
    [self.title mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self);
    }];
    
    [self.subTitle mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.title.mas_bottom).mas_offset(5);
        
    }];
    
    [self.cover mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self.title.mas_top).mas_offset(-12);
    }];
    
}


@end
