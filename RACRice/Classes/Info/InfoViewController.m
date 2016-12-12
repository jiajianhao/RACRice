//
//  InfoViewController.m
//  RACRice
//
//  Created by admin on 2016/12/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "InfoViewController.h"
#import "LoginViewController.h"
@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    }
 -(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     NSString *str = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:LOGIN_STATE]];
     if ([str isEqualToString:@"true"]) {
         [[NSUserDefaults standardUserDefaults] setObject:@"false" forKey:LOGIN_STATE];
     }
     else{
         LoginViewController *login =[[LoginViewController alloc]init];
         [self.navigationController presentViewController:login animated:YES completion:nil];
     }

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
