//
//  MSVacationProgressView.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import "MSVacationProgressView.h"
#import "MSVacationProgressAnnouncerView.h"
#import "MSVacationProgress.h"
#import "MSVacationProgressScript.h"
#import "Masonry.h"

#define Margin 33
#define ItemH 60
#define ItemSize CGSizeMake([UIScreen mainScreen].bounds.size.width - 2*(Margin), ItemH)

@interface MSVacationProgressView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)MSVacationProgress *progress;
@property(nonatomic,strong)MSVacationProgressViewAppearanceConfig *config;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *scripts;

@end
@implementation MSVacationProgressView

#pragma mark lazy
-(MSVacationProgress *)progress {
    if (!_progress) {
        __weak typeof(self) weakself = self;
        _progress = [MSVacationProgress MSVacationProgressWithConfig:^(MSVacationProgressAppearanceConfig *config) {
            config = weakself.config.progressConfig;
        }];
    }
    return _progress;
}
-(NSMutableArray *)scripts {
    if (!_scripts) {
        _scripts = [NSMutableArray array];
    }
    return _scripts;
}
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        
        layout.itemSize = ItemSize;
        layout.minimumLineSpacing=0;
        layout.minimumInteritemSpacing=0;
        layout.scrollDirection = [self verticalDirection]?UICollectionViewScrollDirectionVertical:UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        _collectionView.pagingEnabled = true;
        _collectionView.scrollEnabled = false;
        _collectionView.bounces=false;
        _collectionView.showsHorizontalScrollIndicator=false;
        _collectionView.showsVerticalScrollIndicator = false;
        _collectionView.scrollsToTop=false;
        [_collectionView registerClass:[MSVacationProgressAnnouncerView class] forCellWithReuseIdentifier:[MSVacationProgressAnnouncerView identifier]];
        _collectionView.backgroundColor = [UIColor clearColor];
        
    }
    return _collectionView;
}
-(MSVacationProgressViewAppearanceConfig *)config {
    if (!_config) {
        _config = [MSVacationProgressViewAppearanceConfig defauteAppearConfig];
    }
    return _config;
}
#pragma mark publicFunc
+(instancetype)createWithAppearanceConfig:(void (^)(MSVacationProgressViewAppearanceConfig *))appearConfig {
    MSVacationProgressView *view = [[MSVacationProgressView alloc]init];
    !appearConfig?:appearConfig(view.config);
    if (!view.config) {return nil;}
    [view setBackgroundColor:view.config.bgColor];
    [view addSubviews];

    return view;
}
-(void)show {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(scriptsForMSVacationProgressView:)]) {
        NSArray <MSVacationProgressScript *>*scripts = [self.dataSource scriptsForMSVacationProgressView:self];
        [self.scripts removeAllObjects];
        __weak typeof(self) weakSelf = self;
        [scripts enumerateObjectsUsingBlock:^(MSVacationProgressScript * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj grundScript]) {
                [weakSelf.scripts addObject:obj];
            }
        }];
        if (!self.scripts.count) {return;}
        [self.collectionView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showAnimation];
        });
    }
}
-(void)dismiss {
    [self removeFromSuperview];
    [self.progress setProgress:0 andInterval:0.1 animatedFinish:nil];
    _config = nil;
    _collectionView = nil;
    _scripts = nil;
}
#pragma mark funcs
-(void)showAnimation {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(MSVacationProgressViewWillShowAnimate:)]) {
        [self.delegate MSVacationProgressViewWillShowAnimate:self];
    }
    [self setupScrollview];
    MSVacationProgressScript *firstScript = [self normaltTransitions]? self.scripts.firstObject:self.scripts.lastObject;
    [self showAnimationWithScript:firstScript];
}



-(void)addSubviews {
    [self addSubview:self.progress];
    __weak typeof(self) weakSelf = self;
    [self.progress mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.mas_centerY);
        make.leading.mas_equalTo(weakSelf).mas_offset(Margin);
        make.trailing.mas_equalTo(weakSelf).mas_offset(-Margin);
        make.height.mas_equalTo(weakSelf.config.progressH);
    }];
    [self addSubview:self.collectionView];
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(weakSelf.progress);
        make.bottom.mas_equalTo(weakSelf.progress.mas_top).mas_offset(-50);
        make.height.mas_equalTo(ItemH);
    }];
}
-(void)setupScrollview {
    //针对反向操作
    if ([self normaltTransitions]) {return;}
    //反向时 滑动至末尾
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.scripts.count-1 inSection:0] atScrollPosition:(UICollectionViewScrollPositionNone) animated:NO];
}
-(void)showAnimationWithScript:(MSVacationProgressScript *)script{
    
    NSUInteger currentIndex = [self.scripts indexOfObject:script];
    
    float targetProgress = ([self normaltTransitions]?((currentIndex+1)*1.0):(((self.scripts.count-1) - currentIndex + 1)*1.0))/((self.scripts.count)*1.0);
    
    __weak typeof(self) weakself = self;
    NSInteger next = [weakself normaltTransitions] ? currentIndex + 1:currentIndex-1;
    
    if (next < -1 || next == self.scripts.count+1) {return;}
    if (self.delegate&&[self.delegate respondsToSelector:@selector(MSVacationProgressViewSwitchingScript:andCurrentScript:andCurrentIndex:)]) {
        [self.delegate MSVacationProgressViewSwitchingScript:self andCurrentScript:script andCurrentIndex:currentIndex];
    }
    
    [self.progress setProgress:targetProgress andInterval:script.interval animatedFinish:^{
        if ([weakself normaltTransitions]) {
            //正向
            if (currentIndex != weakself.scripts.count - 1) {
                //继续执行
                NSUInteger nextIndex = currentIndex + 1;
                [weakself progressWithIndex:nextIndex];
            }else{
                [weakself progressAnimationFinish];
            }
        }else{
            //反向
            if (currentIndex != 0) {
                //继续执行
                NSUInteger nextIndex = currentIndex - 1;
                [weakself progressWithIndex:nextIndex];
            }else{
               [weakself progressAnimationFinish];
            }
        }
    }];
}
-(void)progressWithIndex:(NSUInteger)nextIndex {
    //翻页
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:nextIndex inSection:0] atScrollPosition:(UICollectionViewScrollPositionNone) animated:YES];
    MSVacationProgressScript *nextScript = self.scripts[nextIndex];
    [self showAnimationWithScript:nextScript];
    
}
-(void)progressAnimationFinish {
    //进度条展示完毕
    if (self.delegate && [self.delegate respondsToSelector:@selector(MSVacationProgressViewWillFinishAnimate:)]) {
        [self.delegate MSVacationProgressViewWillFinishAnimate:self];
    }
}


#pragma mark delegate & datasource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MSVacationProgressAnnouncerView *announcer = [collectionView dequeueReusableCellWithReuseIdentifier:[MSVacationProgressAnnouncerView identifier] forIndexPath:indexPath];
    announcer.AppearanceConfig(self.config);
    
    if ([self normaltTransitions]) {
        //正向
        announcer.Script(self.scripts[indexPath.row]);
    }else{
        //反向
        NSInteger index = (self.scripts.count-1)-indexPath.row;
        announcer.Script(self.scripts[index]);
    }
    return announcer;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.scripts.count;
}
#pragma mark tools
///是否是正向
-(BOOL)normaltTransitions {
    return ((self.config.transitions == AnnouncerTransitionsTypeIsLeftward)|| (self.config.transitions == AnnouncerTransitionsTypeIsUpward));
}
///是否是垂直方向
-(BOOL)verticalDirection{
    return ((self.config.transitions == AnnouncerTransitionsTypeIsUpward)||(self.config.transitions == AnnouncerTransitionsTypeIsDownward));
}


@end
