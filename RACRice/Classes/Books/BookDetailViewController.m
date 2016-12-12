//
//  BookDetailViewController.m
//  RACRice
//
//  Created by admin on 2016/12/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "BookDetailViewController.h"
#import "BookModel.h"
@interface BookDetailViewController ()
@property (nonatomic,strong)IBOutlet UIButton *backBtn;
@property (nonatomic,strong)IBOutlet UILabel *labelDetail;

@end

@implementation BookDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (_sendData!=nil) {
        
        BookModel *book1 = [[BookModel alloc]initWithDict:_sendData];
        self.title=book1.name;

    }
    if (_briefRead) {
        self.labelDetail.text=@"谢谢查看";
    }
    
    
    [[self.backBtn
      rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(NSNumber*signedIn){
         if (self.delegateSignal) {
             // 有值，才需要通知
             [self.delegateSignal sendNext:nil];
             [self.navigationController popViewControllerAnimated:YES];
             
         }
         
     }];
    
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
