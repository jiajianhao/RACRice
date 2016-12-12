//
//  BookModel.m
//  RACRice
//
//  Created by admin on 2016/12/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel
-(id)initWithDict:(NSDictionary*)dic{
    self = [super init];
    if (self != nil) {
        //        if ([x isKindOfClass:[NSDictionary class]]) {
        self.name = [NSString stringWithFormat:@"%@",[dic objectForKey:@"name"]];
        self.author = [NSString stringWithFormat:@"%@",[dic objectForKey:@"author"]];
        //        }
        
        
        
    }
    return self;
}

@end
