//
//  FlagItem.h
//  ReactiveCocoaDemo
//
//  Created by admin on 2016/12/7.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlagItem : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *tel;

-(id)initWithDict:(NSDictionary*)x;

@end
