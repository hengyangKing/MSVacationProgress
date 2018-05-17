//
//  MSVacationProgress.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "MSVacationProgress.h"
#import "MSVacationProgressAppearanceConfig.h"
#import "Masonry.h"

@interface MSVacationProgress()
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIView *innerView;
@property(nonatomic,strong)MSVacationProgressAppearanceConfig *config;
@end
@implementation MSVacationProgress
#pragma mark lazy

-(MSVacationProgressAppearanceConfig *)config {
    if (!_config) {
        _config = [MSVacationProgressAppearanceConfig defauteAppearConfig];
    }
    return _config;
}
-(UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _bgView;
}
-(UIView *)innerView {
    if (!_innerView) {
        _innerView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _innerView;
}
+(instancetype)MSVacationProgressWithConfig:(void (^)(MSVacationProgressAppearanceConfig *))config {
    MSVacationProgress *view = [[MSVacationProgress alloc]init];
    !config?:config(view.config);
    if (!view.config) {return nil;}
    [view createUI];
    return view;
}
-(void)createUI {
    [self.bgView setBackgroundColor:self.config.tintColor];
    [self.innerView setBackgroundColor:self.config.innerColor];
    self.bgView.layer.cornerRadius = self.config.radius;
    [self.bgView.layer setMasksToBounds:YES];
    [self addSubview:self.bgView];
    [self addSubview:self.innerView];
    __weak typeof(self) weakself = self;
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(weakself);
    }];
    [self.innerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(weakself.bgView);
        make.width.mas_equalTo(weakself.config.radius*2.0f);
    }];
}

- (void)setProgress:(float)progress andInterval:(NSTimeInterval)interval animatedFinish:(void(^)(void))finish {
    NSTimeInterval time = interval>0?interval:0.3f;
    progress = (progress>=1.0f)?1.0f:progress;
    progress = (progress<=0)?0:progress;
    CGFloat width = progress * self.bgView.bounds.size.width;
    CGFloat pro = MAX(width,self.config.radius*2.0f);
    __weak typeof(self) weakself = self;
    //动画执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakself.innerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(weakself.bgView);
            make.width.mas_equalTo(pro);
        }];
        [self.superview setNeedsUpdateConstraints];
        [self.superview updateConstraintsIfNeeded];
        
        [UIView animateWithDuration:time animations:^{
            [self.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            !finish?:finish();
        }];
    });
}



@end
