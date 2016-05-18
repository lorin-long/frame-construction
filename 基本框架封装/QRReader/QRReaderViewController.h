//
//  QRReaderViewController.h
//
//
//  Created by lorin on 16/5/12.
//  Copyright © 2016年 lorin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QRReaderViewControllerDelegate;

@interface QRReaderViewController : UIViewController

@property (nonatomic, assign) id<QRReaderViewControllerDelegate> delegate;

@end

@protocol QRReaderViewControllerDelegate <NSObject>

- (void)didFinishedReadingQR:(NSString *)string;

@end
