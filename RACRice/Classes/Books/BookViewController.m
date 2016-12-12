//
//  BookViewController.m
//  RACRice
//
//  Created by admin on 2016/12/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "BookViewController.h"
#import "RequestViewModel.h"
#import "BookTableViewCell.h"
#import "MJRefresh.h"
#import "BookDetailViewController.h"
@interface BookViewController ()
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) RequestViewModel *reqViewModel;
@property(strong, nonatomic) CETableViewBindingHelper *helper;
@end

@implementation BookViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.title=@"啊啊啊啊";
     self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -54, SCREEN_WIDTH, self.view.frame.size.height)];
    [self.view addSubview:self.tableView];
    //数据源信号
    RACSignal *sourceSignal = [[self.reqViewModel.reuqesCommand executionSignals] switchToLatest];
    
    RACCommand *selectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(RACTuple *turple) {
        NSLog(@"%@",turple.first);
        NSLog(@"%@",turple.second);
        
      
        BookDetailViewController *detailVc = [[BookDetailViewController alloc] init];
        detailVc.sendData = turple.first;
        // 设置代理信号
        detailVc.delegateSignal = [RACSubject subject];
        detailVc.hidesBottomBarWhenPushed=YES;
        // 订阅代理信号
        [detailVc.delegateSignal subscribeNext:^(id x) {
             NSLog(@"点了返回键");
        }];
        
        [self.navigationController pushViewController:detailVc animated:YES];
        
        return [RACSignal empty];
    }];
    //列表绑定数据
    self.helper = [CETableViewBindingHelper bindingHelperForTableView:self.tableView sourceSignal:sourceSignal selectionCommand:selectCommand customCellClass:[BookTableViewCell class]];
    
    //滑动到底部时，自动加载新的数据
    self.helper.scrollViewDelegate = self.reqViewModel;
    
    @weakify(self)
    
    //设置下拉刷新
    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self)
        [self.reqViewModel.reuqesCommand execute:nil];
    }];
    
    //设置上拉加载更多
    //    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
    //        @strongify(self)
    //        [self.requestViewModel loadNextPageData];
    //    }];
    
    
    //执行完关闭下拉刷新
    [self.reqViewModel.reuqesCommand.executing subscribeNext:^(id isExcuting) {
        @strongify(self)
        if (![isExcuting boolValue]) {
            [self.tableView.mj_header endRefreshing];
            //            [self.tableView.mj_footer endRefreshing];
        }
    }];
    //错误处理
    [self.reqViewModel.reuqesCommand.errors subscribeNext:^(id x) {
        //        [[ToastHelper sharedToastHelper] toast:[NSErrorHelper handleErrorMessage:x]];
    }];
    
    
    //开始获取数据
    [self.tableView.mj_header beginRefreshing];
    
}
- (RequestViewModel *)reqViewModel
{
    if (_reqViewModel == nil) {
        _reqViewModel = [[RequestViewModel alloc] init];
    }
    return _reqViewModel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
