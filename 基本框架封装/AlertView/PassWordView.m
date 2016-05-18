//
//  PassWordView.m
//  基本框架封装
//
//  Created by lorin on 16/5/11.
//  Copyright © 2016年 lorin. All rights reserved.
//


#import "PassWordView.h"
#import <QuartzCore/QuartzCore.h>
#import "Masonry.h"

#define kLineTag 1000
#define kDotTag  3000
#define kPasswordLength  6
#define WIdTH [UIScreen mainScreen].bounds.size.width
@interface PassWordView()<UITextFieldDelegate>
{
    
}
@property(nonatomic,strong)UIView *overlayView;//背景
@property(nonatomic,strong)UILabel *titleLabel;//标题
@property(nonatomic,strong)UILabel *lineLabel;//线条
@property(nonatomic,strong)YLPasswordTextFiled *textFiled;//输入文本框
@property (nonatomic, strong) UIView *centerView;
@property(nonatomic,strong)UIButton *cancelButton;//取消按钮
@property (nonatomic, strong) UIView *moneyView;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UILabel *bankCard;

@end

@implementation PassWordView

-(instancetype)init{
    if(self = [super init]){
        [self customInit];
    }
    return self;
}
#pragma mark init
-(void)customInit
{

    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5; //设置圆角
    self.backgroundColor = [UIColor whiteColor];
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textColor = [UIColor blackColor];
    [self addSubview:_titleLabel];
    _cancelButton=[[UIButton alloc]init];
    [_cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [_cancelButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [self addSubview:_cancelButton];
    _moneyView = [UIView new];
    [self addSubview:_moneyView];
    
    _leftLabel = [UILabel new];
    _leftLabel.font = [UIFont systemFontOfSize:14];
    [_moneyView addSubview:_leftLabel];
    
    _rightLabel = [UILabel new];
    _rightLabel.font = [UIFont boldSystemFontOfSize:15];
    _rightLabel.textColor = [UIColor blackColor];
    [_moneyView addSubview:_rightLabel];
    
    _lineLabel = [[UILabel alloc]init];
    _lineLabel.backgroundColor = [UIColor lightGrayColor];
    _lineLabel.alpha = 0.7;
    [self addSubview:_lineLabel];
    
    
    _bankCard = [UILabel new];
    _bankCard.font = [UIFont systemFontOfSize:14];
    [self addSubview:_bankCard];
    
    
    _textFiled = [[YLPasswordTextFiled alloc]init];
    _textFiled.backgroundColor = [UIColor whiteColor];
    _textFiled.layer.masksToBounds = YES;
    _textFiled.layer.borderColor = [UIColor grayColor].CGColor;
    _textFiled.layer.borderWidth = 1;
    _textFiled.layer.cornerRadius = 5;
    _textFiled.secureTextEntry = YES;
    _textFiled.delegate = self;
    _textFiled.tintColor = [UIColor clearColor];//看不到光标
    _textFiled.textColor = [UIColor clearColor];//看不到输入内容
    _textFiled.font = [UIFont systemFontOfSize:30];
    _textFiled.keyboardType = UIKeyboardTypeNumberPad;
    _textFiled.pattern = [NSString stringWithFormat:@"^\\d{%li}$",(long)kPasswordLength];
    [_textFiled addTarget:self action:@selector(textFiledEdingChanged) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_textFiled];
    
    _overlayView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _overlayView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self addSubview:_overlayView];
}

//设置上面的子视图的位置
-(void)setFrame:(CGRect)frame{
    [super  setFrame:frame];
    _textFiled.frame = CGRectMake(20  , 110, frame.size.width - 2 * 20, 35);
    _overlayView.frame = [UIScreen mainScreen].bounds;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(15);
    }];
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.width.equalTo(@16);
        make.height.equalTo(@16);
    }];
    [_moneyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_titleLabel.mas_bottom).offset(4);
        make.height.equalTo(@27);
        make.width.equalTo(@160);
    }];
    
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_moneyView.mas_left);
        make.top.equalTo(_moneyView.mas_top);
    }];
    
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_moneyView.mas_right);
        make.top.equalTo(_moneyView.mas_top);
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_moneyView.mas_bottom);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(@250);
        make.height.equalTo(@1);
    }];
    
    [_bankCard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_lineLabel.mas_bottom).offset(8);
    }];
}
/**
 *  设置文字
 *
 */
-(void)setTitleModel:(NSDictionary *)model{
    NSString *title=model[@"title"];
    NSString *payName=model[@"payName"];
    NSString *money=model[@"money"];
    NSString *cardName=model[@"cardName"];
    _titleLabel.text=title;
    _leftLabel.text=payName;
    _rightLabel.text=money;
    _bankCard.text=cardName;

}


#pragma mark ---Animation methods
-(void)fadeIn
{
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    }completion:^(BOOL finished) {
        [_textFiled becomeFirstResponder];
    }];
}

- (void)dismiss
{
    [self endEditing:YES];
    
    [UIView animateWithDuration:.35 animations:^{
        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [_overlayView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
    
}

- (void)pop
{
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:_overlayView];
    [keywindow addSubview:self];
    
    self.center = CGPointMake(keywindow.bounds.size.width/2.0f,
                              keywindow.bounds.size.height/2.0f-100);
    [self fadeIn];
}


-(void)textFiledEdingChanged
{
    NSInteger length = _textFiled.text.length;
    NSLog(@"lenght=%li",(long)length);
    if(length==kPasswordLength){
        if (_block) {
            _block(_textFiled.text);
        }
        
    }
    for(NSInteger i=0;i<kPasswordLength;i++){
        UILabel *dotLabel = (UILabel *)[_textFiled viewWithTag:kDotTag + i];
        if(dotLabel){
            dotLabel.hidden = length <= i;
        }
    }
}


- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

-(void)dealloc
{
    [_textFiled removeTarget:self action:@selector(textFiledEdingChanged) forControlEvents:UIControlEventEditingChanged];
}
@end


#pragma mark 输入框的处理
@implementation YLPasswordTextFiled
-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    CGFloat perWidth = (frame.size.width - kPasswordLength + 1)*1.0/kPasswordLength;
    for(NSInteger i=0;i<kPasswordLength;i++){
        if(i < kPasswordLength - 1){
            UILabel *vLine = (UILabel *)[self viewWithTag:kLineTag + i];
            if(!vLine){
                vLine = [[UILabel alloc]init];
                vLine.tag = kLineTag + i;
                [self addSubview:vLine];
            }
            vLine.frame = CGRectMake(perWidth + (perWidth + 1)*i, 0, 1, frame.size.height);
            vLine.backgroundColor = [UIColor grayColor];
        }
        UILabel *dotLabel = (UILabel *)[self viewWithTag:kDotTag + i];
        if(!dotLabel){
            dotLabel = [[UILabel alloc]init];
            dotLabel.tag = kDotTag + i;
            [self addSubview:dotLabel];
        }
        dotLabel.frame = CGRectMake((perWidth + 1)*i + (perWidth - 10)*0.5, (frame.size.height - 10)*0.5, 10, 10);
        dotLabel.layer.masksToBounds = YES;
        dotLabel.layer.cornerRadius = 5;
        dotLabel.backgroundColor = [UIColor blackColor];
        dotLabel.hidden = YES;
    }
}

//禁止复制粘帖
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if(menuController){
        menuController.menuVisible = NO;
    }
    return NO;
}

@end
