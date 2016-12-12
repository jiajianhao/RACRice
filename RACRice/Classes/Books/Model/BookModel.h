//
//  BookModel.h
//  RACRice
//
//  Created by admin on 2016/12/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *author;

-(id)initWithDict:(NSDictionary*)dic;
@end
