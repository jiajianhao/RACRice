//
//  BookTableViewCell.m
//  RACRice
//
//  Created by admin on 2016/12/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "BookTableViewCell.h"
#import "BookModel.h"
#import "BookDetailViewController.h"
#import "UITableViewCell+TableView.h"

@implementation BookTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)bindViewModel:(NSDictionary *)flag forIndexPath:(NSIndexPath *)indexPath {
    
    BookModel *item = [[BookModel  alloc]initWithDict:flag];
    
    self.labelName.text = [NSString stringWithFormat:@"  %d -- %@",(int)indexPath.row,item.name];
    self.labelAuthor.text = [NSString stringWithFormat:@"  %@" ,item.author];
    self.aButton.rac_command=[[RACCommand alloc]  initWithSignalBlock:^RACSignal *(id input) {
        BookDetailViewController *looklook=[[BookDetailViewController alloc]init];
        looklook.sendData=flag;
        looklook.hidesBottomBarWhenPushed=YES;
        looklook.briefRead=YES;
        looklook.delegateSignal = [RACSubject subject];

        [[self controller].navigationController pushViewController:looklook animated:YES];
        
        return [RACSignal empty];
    }];
    
//    [[self.aButton rac_signalForControlEvents:UIControlEventTouchUpInside]
//     subscribeNext:^(id x) {
//         NSLog(@"x %@", x);
//         
//         BookDetailViewController *looklook=[[BookDetailViewController alloc]init];
//         looklook.sendData=flag;
//         looklook.hidesBottomBarWhenPushed=YES;
//         [[self controller].navigationController pushViewController:looklook animated:YES];
//     }];
    
    
}
- (UIViewController *)getPresentedViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    return topVC;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
