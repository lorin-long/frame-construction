//
//  CYLSameCityViewController.m
//  基本框架封装
//
//  Created by lorin on 16/5/10.
//  Copyright © 2016年 lorin. All rights reserved.
//

#import "CYLSameCityViewController.h"
#import "MLMessageHUD.h"
@interface CYLSameCityViewController ()<UITableViewDelegate,UITableViewDataSource>
typedef NS_ENUM(NSInteger, MLSelectedType) {
    
    MLSelectedTypeShow = 0, //
    MLSelectedTypeShowDismissWithSuccessMessage,
    MLSelectedTypeShowDismissWithErrorMessage,
    MLSelectedTypeShowSuccessMessage,
    MLSelectedTypeShowErrorMessage,
    
    MLSelectedTypeShowSuccessMessageNavigationBar,
    MLSelectedTypeShowErrorMessageNavigationBar,
    
    MLSelectedTypeShowMessage =7,
};
@property( nonatomic,copy)NSMutableArray *cellTitle;
@end

static CGFloat const duration = 0.7;

@implementation CYLSameCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.view.backgroundColor=[UIColor whiteColor];
    UITableView *vc=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    vc.delegate=self;
    vc.dataSource=self;
    [vc registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:vc];
    _cellTitle=[NSMutableArray arrayWithObjects:@"SelectedTypeShow",@"SelectedTypeShowDismissWithSuccessMessage",@"SelectedTypeShowDismissWithErrorMessage",@"SelectedTypeShowSuccessMessage",@"SelectedTypeShowErrorMessage",@" SelectedTypeShowSuccessMessageNavigationBar",@"SelectedTypeShowErrorMessageNavigationBar",@"SelectedTypeShowMessage", nil];;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cellTitle.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    for (int i=0; i<_cellTitle.count; i++) {
        cell.textLabel.text=_cellTitle[indexPath.row];
    }
    cell.textLabel.font=[UIFont systemFontOfSize:12];
        return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)      indexPath{
    switch (indexPath.row) {
        case MLSelectedTypeShow:
        {
            [MLMessageHUD show];
        }
            break;
            
        case MLSelectedTypeShowDismissWithSuccessMessage:
        {
            [MLMessageHUD show];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MLMessageHUD dismissWithMessage:@"Load Success" messageType:MLHUDMessageTypeSuccess];
            });
        }
            break;
            
        case MLSelectedTypeShowDismissWithErrorMessage:
        {
            [MLMessageHUD show];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MLMessageHUD dismissWithMessage:@"Load Error" messageType:MLHUDMessageTypeError];
            });
        }
            break;
            
        case MLSelectedTypeShowSuccessMessage:
        {
            [MLMessageHUD showSuccessMessage: @"Load Success" showStyle: MLHUDShowStyleNormal];
            //            [MLMessageHUD showSuccessMessage: @"Loading Success"]; // 等价于上面这个方法, 默认的 ShowStyle 就是 MLHUDShowStyleNormal
        }
            break;
            
        case MLSelectedTypeShowErrorMessage:
        {
            [MLMessageHUD showErrorMessage: @"Load Error" showStyle: MLHUDShowStyleNormal];
            //            [MLMessageHUD showErrorMessage: @"Loading Error"]; // 等价于上面这个方法, 默认的 ShowStyle 就是 MLHUDShowStyleNormal
        }
            break;
            
        case MLSelectedTypeShowSuccessMessageNavigationBar:
        {
            [MLMessageHUD showSuccessMessage: @"Load Success" showStyle: MLHUDShowStyleNavigationBar];
        }
            break;
            
        case MLSelectedTypeShowErrorMessageNavigationBar:
        {
            [MLMessageHUD showErrorMessage: @"Load Error" showStyle: MLHUDShowStyleNavigationBar];
        }
            break;
            
        case MLSelectedTypeShowMessage:
        {
            [MLMessageHUD showSuccessMessage: @"Refresh Success" showStyle: MLHUDShowStyleStatusBar];
        }
            
        default:
            break;
    }
    
}

@end
