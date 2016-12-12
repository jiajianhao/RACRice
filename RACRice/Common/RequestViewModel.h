//
//  RequestViewModel.h
//  ReactiveCocoaDemo
//
//  Created by admin on 2016/12/8.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
/*****UITableViewDataSource不要放这边****/
@interface RequestViewModel : NSObject<UITableViewDelegate>
// 请求命令
@property (nonatomic, strong, readonly) RACCommand *reuqesCommand;

//模型数组
@property (nonatomic, strong) NSArray *models;
- (void)loadNextPageData;

@end
