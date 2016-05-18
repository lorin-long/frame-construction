//
//  LJAlertView.h
//  基本框架封装
//
//  Created by lorin on 16/5/11.
//  Copyright © 2016年 lorin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LJAlertViewDelegate <NSObject>
-(void)alSubmitBtnAction;

@end
@interface LJAlertView : UIView

@property (nonatomic,weak)id<LJAlertViewDelegate>delegate;
-(void)setTitleModel:(id)model;



@end
