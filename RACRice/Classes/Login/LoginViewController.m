//
//  LoginViewController.m
//  RACRice
//
//  Created by admin on 2016/12/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (nonatomic,strong)IBOutlet UITextField *phoneTextfield;
@property (nonatomic,strong)IBOutlet UITextField *pwdTextfield;
@property (nonatomic,strong)IBOutlet UIButton *loginBtn;
@property (nonatomic,strong)IBOutlet UIButton *eyeBtn;
@property (nonatomic,strong)IBOutlet UIImageView *userImageview;
@property (nonatomic,strong)IBOutlet UIImageView *pwdImageview;
@property (nonatomic,strong)IBOutlet UIButton *backBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addLoginButton];
    
}
-(void)addLoginButton{
    
    //    RACSignal *usernameSignal =
    //    [self.phoneTextfield.rac_textSignal
    //     map:^id(NSString *text) {
    //         return text;
    //     }];
    RAC(self.userImageview ,image) =  [self.phoneTextfield.rac_textSignal
                                       map:^id(NSString *text){
                                           return self.phoneTextfield.isEditing ? [UIImage imageNamed:@"账号操作中图标"]:[UIImage imageNamed:@"账号图标"];
                                       }];
    RAC(self.pwdImageview ,image) =  [self.pwdTextfield.rac_textSignal
                                      map:^id(NSString *text){
                                          return self.pwdTextfield.isEditing ? [UIImage imageNamed:@"密码操作中图标"]:[UIImage imageNamed:@"密码图标"];
                                      }];
    //    RAC(self.eyeBtn.imageView , image) = [self ]
    
    //    [[self.phoneTextfield rac_signalForControlEvents:UIControlEventEditingDidBegin] subscribeNext:^(id x){
    //        self.userImageview.image =[UIImage imageNamed:@"账号操作中图标"];
    //    }];
    //
    //    [[self.phoneTextfield rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x){
    //          self.userImageview.image =[UIImage imageNamed:@"账号图标"];
    //
    //    }];
    //    [[self.pwdTextfield rac_signalForControlEvents:UIControlEventEditingDidBegin] subscribeNext:^(id x){
    //        self.pwdImageview.image =[UIImage imageNamed:@"密码操作中图标"];
    //    }];
    //
    //    [[self.pwdTextfield rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x){
    //        self.pwdImageview.image =[UIImage imageNamed:@"密码图标"];
    //
    //    }];
    
    
    
    //    RAC(self.pwdTextfield, backgroundColor) =
    //    [validPasswordSignal
    //     map:^id(NSNumber *passwordValid){
    //         return[passwordValid boolValue] ? [UIColor clearColor]:[UIColor lightGrayColor];
    //     }];
    //
    //    RAC(self.phoneTextfield, backgroundColor) =
    //    [validUsernameSignal
    //     map:^id(NSNumber *passwordValid){
    //         return[passwordValid boolValue] ? [UIColor clearColor]:[UIColor lightGrayColor];
    //     }];
    //*********************************//
    //聚合信号,满足两个条件
    RACSignal *validUsernameSignal =
    [self.phoneTextfield.rac_textSignal
     map:^id(NSString *text) {
         return @([self isValidUsername:text]);
     }];
    RACSignal *validPasswordSignal =
    [self.pwdTextfield.rac_textSignal
     map:^id(NSString *text) {
         return @([self isValidPassword:text]);
     }];
    
    RACSignal *signUpActiveSignal =
    [RACSignal combineLatest:@[validUsernameSignal, validPasswordSignal]
                      reduce:^id(NSNumber*usernameValid, NSNumber *passwordValid){
                          return @([usernameValid boolValue]&&[passwordValid boolValue]);
                      }];
    [signUpActiveSignal subscribeNext:^(NSNumber*signupActive){
        self.loginBtn.enabled =[signupActive boolValue];
        if (self.loginBtn.enabled) {
            self.loginBtn.backgroundColor = [UIColor orangeColor];
        }
        else{
            self.loginBtn.backgroundColor = [UIColor colorWithRed:154.0/255.0 green:154.0/255.0 blue:154.0/255.0 alpha:0.4];
        }
    }];
    ////////登录按钮
    [[[self.loginBtn
       rac_signalForControlEvents:UIControlEventTouchUpInside]
      doNext:^(id x){
          self.loginBtn.enabled =NO;
      }]
     subscribeNext:^(NSNumber*signedIn){
         self.loginBtn.enabled =YES;
         [self doLogIn];
     }];
    ////////密码显示
     [[self.eyeBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x){
         self.eyeBtn.selected = !self.eyeBtn.selected;
         self.pwdTextfield.secureTextEntry = !self.eyeBtn.selected;
     }];
    ////////返回键
    [[self.backBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x){
         AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
         UITabBarController *tab = (UITabBarController *)delegate.window.rootViewController;
         tab.selectedIndex = 0;
         [self dismissViewControllerAnimated:YES completion:nil];
         
      
     }];
    /////手势
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
    [[tap rac_gestureSignal] subscribeNext:^(UITapGestureRecognizer * tap) {
        [self.phoneTextfield resignFirstResponder];
        [self.pwdTextfield resignFirstResponder];

    }];
    [self.view addGestureRecognizer:tap];
}
- (BOOL)isValidUsername:(NSString *)username {
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:username];
    //    return _phoneTextfield.text.length == 11;
}

- (BOOL)isValidPassword:(NSString *)password {
    NSString *pwdStr = @"^(?![\\d]+$)(?![a-zA-Z]+$)(?![^\\da-zA-Z]+$).{6,20}$";
    NSPredicate *predPwd = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pwdStr];
    return [predPwd evaluateWithObject:password];
}
//- (RACSignal *)signInSignal {
//    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
//        [self.signInService
//         signInWithUsername:self.usernameTextField.text
//         password:self.passwordTextField.text
//         complete:^(BOOL success){
//             [subscriber sendNext:@(success)];
//             [subscriber sendCompleted];
//         }];
//        return nil;
//    }];
//}

-(void)doLogIn{
        
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"q"] = @"基础";
    
    
    [AFNHelper get:@"https://api.douban.com/v2/book/search" parameter:parameters success:^(id responseObject) {            [[NSUserDefaults standardUserDefaults] setObject:@"true" forKey:LOGIN_STATE];
                                UIAlertController *alert    = [UIAlertController alertControllerWithTitle:@"登录成功" message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
                                UIAlertAction *okAction     = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                                    // 点击确定按钮时 要进行的操作可以写到这里
            //                        [alert dismissViewControllerAnimated:YES completion:nil];
                                    [self dismissViewControllerAnimated:YES completion:nil];
            
                                }];
            
                                 [alert addAction:okAction];
                                [self presentViewController:alert animated:YES completion:^{
            
                                }];

        }faliure:^(id error){
            UIAlertController *alert    = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *okAction     = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                // 点击确定按钮时 要进行的操作可以写到这里
                //                        [alert dismissViewControllerAnimated:YES completion:nil];
                
            }];
            
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:^{
                
            }];
 
        }];
        

//        NSString *uuid = [UUID getUUID];
//        NSMutableString *IDStr = [NSMutableString stringWithFormat:@"%@", _phoneTextfield.text];
        
//        NSString *userStr = [IDStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        
//        NSDictionary *parameters = [[NSDictionary alloc]init];
        //        if (_logInView.testedView.hidden == NO) {
        //            parameters = @{@"phone_num": userStr,
        //                           @"password" : _pwdTextfield.text,
        //                           @"UUID" : uuid,
        //                           @"validate_code" : _logInView.testedField.text};
        //        }else{
//        parameters = @{@"phone_num": userStr,
//                       @"password" : _pwdTextfield.text,
//                       @"UUID" : uuid,
//                       @"validate_code" : @(-1)};
        
        //
        //
        //        }
        
        //        ARLog(@"%@",[parameters serializeParams:parameters]);
//        
//        [AFNHelper post:ReadBooks parameters:parameters success:^(id json){
//            NSLog(@"%@",json);
//            NSLog(@"%@",[json class]);
//            if ([json isKindOfClass:[NSDictionary class]]) {
//                NSDictionary *dic1 =[[NSDictionary alloc]initWithDictionary:json copyItems:YES];
//                NSString *codeStr = [NSString stringWithFormat:@"%@",[dic1 objectForKey:@"code"]];
//                
//                if ([codeStr isEqualToString:@"200"]) {
//                    [[NSUserDefaults standardUserDefaults] setObject:@"true" forKey:LOGIN_STATE];
//                    UIAlertController *alert    = [UIAlertController alertControllerWithTitle:@"登录成功" message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
//                    UIAlertAction *okAction     = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//                        // 点击确定按钮时 要进行的操作可以写到这里
////                        [alert dismissViewControllerAnimated:YES completion:nil];
//                        [self dismissViewControllerAnimated:YES completion:nil];
//
//                    }];
//                    
//                     [alert addAction:okAction];
//                    [self presentViewController:alert animated:YES completion:^{
//
//                    }];
// 
//
//                }
//            }
//            NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:nil];
//            
//            NSString *codeStr = [NSString stringWithFormat:@"%@",[dic1 objectForKey:@"code"]];
//            
//            if ([codeStr isEqualToString:@"200"]) {
//                [self dismissViewControllerAnimated:YES completion:nil];
//            }
 //        }faliure:^(id error){
//            NSLog(@"%@",error);
//            
//        }];
//    }
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
