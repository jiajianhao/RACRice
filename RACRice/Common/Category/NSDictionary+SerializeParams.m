//
//  NSDictionary+SerializeParams.m
//  request
//
//  Created by JYH on 16/7/1.
//  Copyright © 2016年 JYH. All rights reserved.
//

#import "NSDictionary+SerializeParams.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSDictionary (SerializeParams)

- (NSDictionary *)serializeParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsDic = [[NSMutableDictionary alloc]init];
    if (params) {
        [paramsDic setValuesForKeysWithDictionary:params];
    }
    NSMutableString *signString = [NSMutableString stringWithFormat:@""];
    NSArray *sortedKeys = [[paramsDic allKeys] sortedArrayUsingSelector: @selector(compare:)];
    for (NSString *key in sortedKeys) {
        [signString appendFormat:@"%@%@", key, [paramsDic objectForKey:key]];
    }
//    ARLog(@"signString = %@",signString);
    [signString appendString:SECERT_KEY];
    const char *cstr = [signString cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *stringBytes = [NSData dataWithBytes:cstr length:signString.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(stringBytes.bytes,stringBytes.length, digest);
    /* SHA-1 hash has been calculated and stored in 'digest'. */
    NSMutableString *digestString = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH *2];
    for (int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [digestString appendFormat:@"%02X", digest[i]];
    }
    
    paramsDic[@"sign"] = [digestString uppercaseString];
    paramsDic[@"secret"] = SECERT_KEY;
    return paramsDic;
}

- (NSString *)serializeWithUrl:(NSDictionary *)params
{

    NSDictionary *resultDict = [params serializeParams:params];
    
    NSMutableDictionary *paramsDic = [[NSMutableDictionary alloc]init];
    if (resultDict) {
        [paramsDic setValuesForKeysWithDictionary:resultDict];
    }
    NSMutableString *signString = [NSMutableString stringWithFormat:@""];
    NSArray *sortedKeys = [[paramsDic allKeys] sortedArrayUsingSelector: @selector(compare:)];
    for (NSString *key in sortedKeys) {
        [signString appendFormat:@"%@=%@", key, [paramsDic objectForKey:key]];
        
            [signString appendFormat:@"&"];
        
        
    }
    
    NSString *resultStr = [signString substringToIndex:[signString length] - 1];
    
    ARLog(@"signString = %@",resultStr);
    
    
    return resultStr;
}

@end
