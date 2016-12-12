//
//  FlagItem.m
//  ReactiveCocoaDemo
//
//  Created by admin on 2016/12/7.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "FlagItem.h"

@implementation FlagItem
-(id)initWithDict:(NSDictionary*)x{
    self = [super init];
    if (self != nil) {
//        if ([x isKindOfClass:[NSDictionary class]]) {
            self.name = [NSString stringWithFormat:@"%@",[x objectForKey:@"name"]];
            self.tel = [NSString stringWithFormat:@"%@",[x objectForKey:@"tel"]];
//        }
        
        
        
    }
    return self;
}
@end
