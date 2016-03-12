//
//  MenuTableViewCell.m
//  Man
//
//  Created by 耿鑫 on 16/3/3.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "MenuTableViewCell.h"
#import "Masonry.h"
@implementation MenuTableViewCell

- (void)awakeFromNib {
  
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        
    self.contentView.backgroundColor=[UIColor clearColor];
        
    //左边
    self.icoImg=[[UIImageView alloc]initWithFrame:CGRectZero];
    self.icoImg.image=[UIImage imageNamed:@"default"];
   
    [self.contentView addSubview:_icoImg];
    [self.icoImg mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.equalTo(self.contentView.mas_left).with.offset(10.0f);

          make.top.equalTo(self.contentView.mas_top).with.offset(5.0f);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
       
        //    中间
        self.MenuLB=[[UILabel alloc]initWithFrame:CGRectZero];
        self.MenuLB.text=@"健康医疗";
        self.MenuLB.font=[UIFont systemFontOfSize:15];
        self.MenuLB.textColor=[UIColor whiteColor];
        [self.contentView addSubview:_MenuLB];
        [self.MenuLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.icoImg.mas_right).with.offset(10.0f);
            make.width.mas_equalTo(@80);
            make.top.equalTo(self.contentView.mas_top).with.offset(5.0f);
//            make.height.mas_equalTo(@60);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10.0f);
        }];
        
        
        
//   右边
        self.daohang=[[UIImageView alloc]initWithFrame:CGRectZero];
        self.daohang.image=[UIImage imageNamed:@"arrow_details"];
        [self.contentView addSubview:_daohang];
        [self.daohang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.MenuLB.mas_right).with.offset(10.0f);
            make.top.equalTo(self.MenuLB.mas_top).with.offset(5.0f);
            
            make.width.mas_equalTo(@10);
            make.height.mas_equalTo(@16);
        }];

        
        


        
        
        
        
}

    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
