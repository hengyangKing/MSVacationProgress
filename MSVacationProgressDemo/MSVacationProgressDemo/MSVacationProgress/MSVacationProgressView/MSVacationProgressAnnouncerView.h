//
//  MSVacationProgressAnnouncerView.h
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/16.
//  Copyright © 2018年 king. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSVacationProgressViewAppearanceConfig.h"
#import "MSVacationProgressScript.h"
@interface MSVacationProgressAnnouncerView : UICollectionViewCell

@property(nonatomic,copy,readonly)void(^AppearanceConfig)(MSVacationProgressViewAppearanceConfig *);

@property(nonatomic,copy,readonly)void(^Script)(MSVacationProgressScript *);

+(NSString *)identifier;

@end
