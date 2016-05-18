//
//  LJAlertView.m
//  基本框架封装
//
//  Created by lorin on 16/5/11.
//  Copyright © 2016年 lorin. All rights reserved.
//

#import "LJAlertView.h"
#import "Masonry.h"
@interface LJAlertView ()
{
    struct {
        unsigned int SubmitBtnAction : 1;
    }_delegateFlags;
}

@property (nonatomic,strong) UIView  *alertView;
@property (nonatomic,strong) UILabel *alTitle;
@property (nonatomic,strong) UIButton *okBtn;
@property (nonatomic,strong) UIButton *cancelBtn;

@end

@implementation LJAlertView
#pragma mark init
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor grayColor];
            [self addSubview:self.alertView];
            [_alertView addSubview:self.alTitle];
            [_alertView addSubview:self.okBtn];
            [_alertView addSubview:self.cancelBtn];
            [self setLayout];

    }
    return self;
}

-(void)setLayout{
    [_alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@300);
        make.height.equalTo(@140);
    }];
    [_alTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_alertView.mas_top).offset(20);
        make.centerX.equalTo(_alertView.mas_centerX);
        make.width.equalTo(@200);
        
    }];
    [_okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_alTitle.mas_bottom).offset(20);
        make.left.equalTo(_alertView.mas_left).offset(30);
        make.width.equalTo(@100);
    }];
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_alTitle.mas_bottom).offset(20);
        make.right.equalTo(_alertView.mas_right).offset(-30);
        make.width.equalTo(@100);
    }];
}
#pragma mark get &set
-(UIView *)alertView{
    _alertView=[[UIView alloc]init];
    _alertView.backgroundColor=[UIColor whiteColor];
    return _alertView;
}
-(UILabel *)alTitle{
    _alTitle=[UILabel new];
    _alTitle.numberOfLines=0;
    _alTitle.font=[UIFont systemFontOfSize:14.f];
    _alTitle.lineBreakMode=NSLineBreakByWordWrapping;
    return _alTitle;
}
-(UIButton *)okBtn{
    _okBtn=[[UIButton alloc]init];
    _okBtn.backgroundColor=[UIColor orangeColor];
    [_okBtn setTintColor:[UIColor whiteColor]];
    [_okBtn addTarget:self action:@selector(didOkBtn:) forControlEvents:UIControlEventTouchUpInside];
    return _okBtn;
}
-(UIButton *)cancelBtn{
    _cancelBtn=[[UIButton alloc]init];
    _cancelBtn.backgroundColor=[UIColor orangeColor];
    [_cancelBtn setTintColor:[UIColor whiteColor]];
    [_cancelBtn addTarget:self action:@selector(didCancelBtn:) forControlEvents:UIControlEventTouchUpInside];

    return _cancelBtn;
}
#pragma mark -
#pragma mark event

-(void)didOkBtn:(id)sender{
    NSLog(@"提交");
        [_delegate alSubmitBtnAction];

}
//取消按钮直接写死了，取消就回到当前视图
-(void)didCancelBtn:(id)sender{
    NSLog(@"取消");
    [self removeFromSuperview];
}
#pragma mark delegate
-(void)setDelegate:(id<LJAlertViewDelegate>)delegate{
    _delegate = delegate;
    _delegateFlags.SubmitBtnAction = [delegate respondsToSelector:@selector(alSubmitBtnAction)];
}
-(void)setTitleModel:(NSDictionary *)model{
    NSString *title = model[@"title"];
    NSString *okBtnTitle = model[@"ok"];
    NSString *cancelBtnTitle = model[@"cancel"];
    _alTitle.text=title;
    [_okBtn setTitle:okBtnTitle forState:UIControlStateNormal];
    [_cancelBtn setTitle:cancelBtnTitle forState:UIControlStateNormal];
}

@end
