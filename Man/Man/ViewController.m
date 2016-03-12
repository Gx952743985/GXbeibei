//
//  ViewController.m
//  Man
//
//  Created by 耿鑫 on 16/3/3.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "SingletonManager.h"
#import "MenuTableViewCell.h"
#define S_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds) //屏幕宽度
#define S_HEIGHT CGRectGetHeight([UIScreen mainScreen].bounds) //屏幕高度

@interface ViewController ()<UITableViewDataSource>
@property (nonatomic,retain)NSMutableArray *Menuarry;
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSString *url=@"http://iapi.ipadown.com/api/yangshen/left.category.api.php?siteid=2&catename=男性保健&type=0";
     [SingletonManager GXMenulisturl:url completion:^(NSMutableArray *dic) {
     [_Menuarry setArray:dic];
     [_MenuTableView reloadData];
     }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *bjimg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu_bg"]];
    bjimg.frame=CGRectZero;
    [self.view addSubview:bjimg];
    [self.view sendSubviewToBack:bjimg];
    [bjimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
    }];

    
    
    
    _Menuarry=[NSMutableArray array];
    
    self.MenuTableView=[[UITableView alloc]initWithFrame:CGRectZero];
    self.MenuTableView.backgroundColor=[UIColor clearColor];
    self.MenuTableView.dataSource=self;
    self.MenuTableView.bounces=NO;
  self.MenuTableView.separatorColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:0.2];
     [self.view addSubview:_MenuTableView];
    self.MenuTableView.showsVerticalScrollIndicator = NO;
     [self.MenuTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20.0f);
        make.right.equalTo(self.view.mas_right).with.offset(S_WIDTH/5*2.5-S_WIDTH);
        make.top.equalTo(self.view.mas_top).with.offset(20.0f);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-20.0f);
     }];
  
    [self.MenuTableView registerClass:[MenuTableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return S_WIDTH/_Menuarry.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _Menuarry.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[MenuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor=[UIColor clearColor];
    }
    cell.textLabel.text=@"dd";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
