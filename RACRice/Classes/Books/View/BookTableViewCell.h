//
//  BookTableViewCell.h
//  RACRice
//
//  Created by admin on 2016/12/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel *labelName;
@property(nonatomic,weak)IBOutlet UILabel *labelAuthor;
@property(nonatomic,weak)IBOutlet UIButton *aButton;

@end
