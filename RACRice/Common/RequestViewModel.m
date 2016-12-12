//
//  RequestViewModel.m
//  ReactiveCocoaDemo
//
//  Created by admin on 2016/12/8.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "RequestViewModel.h"
#import "AFNHelper.h"
@implementation RequestViewModel

- (instancetype)init
{
    if (self = [super init]) {
        
        [self initialBind];
    }
    return self;
}


- (void)initialBind
{
    _reuqesCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            parameters[@"q"] = @"基础";
            
            
            [AFNHelper get:@"https://api.douban.com/v2/book/search" parameter:parameters success:^(id responseObject) {
//                NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
//                
//                NSArray *dictArr2 = [NSArray arrayWithContentsOfFile:filePath2];

                //        NSArray *array = responseObject;
                NSLog(@"%@",responseObject);
                // map:映射的意思，目的：把原始值value映射成一个新值
                // array: 把集合转换成数组
                // 底层实现：当信号被订阅，会遍历集合中的原始值，映射成新值，并且保存到新的数组里。
                //        NSArray *musicArray =[[array.rac_sequence map:^id(id value) {
                //
                //            Music *music = [Music fetchMusicModelWithDict:value ];
                //            return music;
                //        }] array];
                
                //        NSLog(@"--------%@",musicArray);
                [subscriber sendNext:responseObject];
                
                [subscriber sendCompleted];

            } faliure:^(id error) {
                
                NSLog(@"%@",error);
            }];
            
//            // 发送请求
//            [[AFHTTPRequestOperationManager manager] GET:@"https://api.douban.com/v2/book/search" parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//                NSLog(@"%@",responseObject);
//                
//                // 请求成功调用
//                // 把数据用信号传递出去
//                [subscriber sendNext:responseObject];
//                
//                [subscriber sendCompleted];
//                
//                
//            } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
//                // 请求失败调用
//                
//            }];
            
            return nil;
        }];
        
        
        
        
        // 在返回数据信号时，把数据中的字典映射成模型信号，传递出去
        return [requestSignal map:^id(NSDictionary *value) {
//            NSMutableArray *dictArr = value[@"books"];
            
            // 字典转模型，遍历字典中的所有元素，全部映射成模型，并且生成数组
            
//            NSArray *modelArr = [[dictArr.rac_sequence map:^id(id value) {
//                
//                return [Book bookWithDict:value];
//            }] array];
            
            NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"book.plist" ofType:nil];
            
            NSArray *dictArr2 = [NSArray arrayWithContentsOfFile:filePath2];
            // map:映射的意思，目的：把原始值value映射成一个新值
            // array: 把集合转换成数组
            // 底层实现：当信号被订阅，会遍历集合中的原始值，映射成新值，并且保存到新的数组里。
           
            
            NSArray *m_test = [[dictArr2.rac_sequence map:^id(id value){
                return value;
            }]array];
            NSLog(@"m_test:%@",m_test);
            
            return m_test;
        }];
        
    }];
    
}

/**
 *  加载下一页的数据
 */
- (void)loadNextPageData {
//    RACTuple *newTurple = RACTuplePack(@(YES), self.modelArgument, self.modelClass, self.url, self.tableName);
    [self.reuqesCommand execute:nil];
}

@end
