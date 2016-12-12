//
//  NSDictionary+SerializeParams.h
//  request
//
//  Created by JYH on 16/7/1.
//  Copyright © 2016年 JYH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SerializeParams)

- (NSDictionary *)serializeParams:(NSDictionary *)params;

- (NSString *)serializeWithUrl:(NSDictionary *)params;

@end
