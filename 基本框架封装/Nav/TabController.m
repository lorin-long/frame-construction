//
//  TabViewController.m
//  基本框架封装
//
//  Created by lorin on 16/5/10.
//  Copyright © 2016年 lorin. All rights reserved.
//

#import "TabController.h"
#import "KSNavigationController.h"
#import "CYLHomeViewController.h"
#import "CYLSameCityViewController.h"
#import "CYLMineViewController.h"
#import "CYLMessageViewController.h"
@interface TabController ()

@end

@implementation TabController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置字体颜色
    self.tabBar.tintColor=[UIColor blackColor];
    CYLHomeViewController *homeView=[[CYLHomeViewController alloc]init];
    [self addChildViewController:homeView withTitle:@"首页" withImageName:@"barItem1" withSelectImage:@"barItem1_sel"];
    CYLSameCityViewController *cityView=[[CYLSameCityViewController alloc]init];
    [self addChildViewController:cityView withTitle:@"同城" withImageName:@"barItem3" withSelectImage:@"barItem3_sel"];
    CYLMessageViewController *VC=[CYLMessageViewController new];
    [self addChildViewController:VC withTitle:@"信息" withImageName:@"barItem2" withSelectImage:@"barItem2_sel"];
    CYLMineViewController *mineView=[[CYLMineViewController alloc]init];
    [self addChildViewController:mineView withTitle:@"我的" withImageName:@"barItem4" withSelectImage:@"barItem4_sel"];
}

-(void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title withImageName:(NSString *)imageName withSelectImage:(NSString* )selectImage{
    childController.title=title;
    childController.tabBarItem.image=[[UIImage imageNamed:imageName ]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage=[[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    KSNavigationController *naView=[[KSNavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:naView];
}

@end
