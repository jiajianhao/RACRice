//
//  KeyChainStore.h
//  AntRice
//
//  Created by JYH on 16/8/25.
//  Copyright © 2016年 FRAJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainStore : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKeyData:(NSString *)service;

@end
