//
//  BookDetailViewController.h
//  RACRice
//
//  Created by admin on 2016/12/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookDetailViewController : UIViewController
@property (nonatomic, strong) RACSubject *delegateSignal;
@property (nonatomic, strong) NSDictionary *sendData;
@property (nonatomic,assign) BOOL briefRead;
@end
