//
//  CYLMineViewController.m
//  基本框架封装
//
//  Created by lorin on 16/5/10.
//  Copyright © 2016年 lorin. All rights reserved.
//

#import "CYLMineViewController.h"
#import "ADScrollView.h"
#import "ViewController.h"
@interface CYLMineViewController ()

@end

@implementation CYLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    ADScrollView *AdView=[[ADScrollView alloc]initWithFrame:CGRectMake(0, 64,self.view.bounds.size.width, 200)];
    [self.view addSubview:AdView];
    AdView.pics=[NSMutableArray arrayWithObjects:@"http://img.taopic.com/uploads/allimg/130215/240511-13021510291714.jpg",@"http://s.tang-mao.com/Uploads/Editor/2015-05-29/1432892469570136.jpg",@"http://img.taopic.com/uploads/allimg/130807/240451-130PFI24945.jpg",@"http://image.tianjimedia.com/uploadImages/2012/236/2H2TR02NKWAA.jpg",nil];
    //点击事件
    [AdView returnIndex:^(NSInteger index) {
        switch (index) {
            case 0:
            {
                ViewController *view=[[ViewController alloc]init];
                [self.navigationController pushViewController:view animated:YES];
            }
                break;
                
            default:
                break;
        }
    }];
    //刷新（必需的步骤）
    [AdView reloadView];
}
@end
