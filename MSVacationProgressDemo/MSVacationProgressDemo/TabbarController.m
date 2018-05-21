//
//  TabbarController.m
//  MSVacationProgressDemo
//
//  Created by king on 2018/5/21.
//  Copyright © 2018年 king. All rights reserved.
//

#import "TabbarController.h"
#import "ViewController.h"

@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建子控制器
    ViewController *homeVC=[[ViewController alloc] init];
    [self setTabBarItem:homeVC.tabBarItem
                  title:@"vc1"
              titleSize:13.0
          titleFontName:@"HeiTi SC"
          selectedImage:@"i_tab_home_selected"
     selectedTitleColor:[UIColor redColor]
            normalImage:@"i_tab_home_normal"
       normalTitleColor:[UIColor grayColor]];
    
    ViewController *blogVC=[[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:blogVC];
    [self setTabBarItem:nav.tabBarItem
                  title:@"vc2"
              titleSize:13.0
          titleFontName:@"HeiTi SC"
          selectedImage:@"i_tab_blog_selected"
     selectedTitleColor:[UIColor redColor]
            normalImage:@"i_tab_blog_normal"
       normalTitleColor:[UIColor grayColor]];
    
    UINavigationController *homeNV = [[UINavigationController alloc] initWithRootViewController:homeVC];
    UINavigationController *blogNV = [[UINavigationController alloc] initWithRootViewController:blogVC];
    // 把子控制器添加到UITabBarController
    self.viewControllers = @[homeNV, blogNV];
    
}
- (void)setTabBarItem:(UITabBarItem *)tabbarItem
                title:(NSString *)title
            titleSize:(CGFloat)size
        titleFontName:(NSString *)fontName
        selectedImage:(NSString *)selectedImage
   selectedTitleColor:(UIColor *)selectColor
          normalImage:(NSString *)unselectedImage
     normalTitleColor:(UIColor *)unselectColor
{
    
    //设置图片
    tabbarItem = [tabbarItem initWithTitle:title image:[[UIImage imageNamed:unselectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    // S未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:unselectColor,NSFontAttributeName:[UIFont fontWithName:fontName size:size]} forState:UIControlStateNormal];
    
    // 选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:selectColor,NSFontAttributeName:[UIFont fontWithName:fontName size:size]} forState:UIControlStateSelected];
}



@end
