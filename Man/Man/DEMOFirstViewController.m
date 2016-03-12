//
//  DEMOFirstViewController.m
//  RESideMenuExample
//
//  Created by Roman Efimov on 10/10/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOFirstViewController.h"
#import "SingletonManager.h"
#import "ListTableViewController.h"
#import "SDCycleScrollView.h"
#import "Masonry.h"
#import "SingletonManager.h"

#import "URlViewController.h"
#define S_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds) //屏幕宽度
#define S_HEIGHT CGRectGetHeight([UIScreen mainScreen].bounds) //屏幕高度
#define App_ZTHEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高
#define APP_DHHEIGHT self.navigationController.navigationBar.frame.size.height //导航栏高
@interface DEMOFirstViewController ()<SDCycleScrollViewDelegate>

@end

@implementation DEMOFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
  [self.navigationController.navigationBar setBarTintColor:[UIColor brownColor]];
	self.title = @"全网最好笑";

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    设置大小
    button.frame = CGRectMake(100, 1000, 30, 30 );
    [button setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:button];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.image = [UIImage imageNamed:@"Balloon"];
    [self.view addSubview:imageView];

    
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ListTableViewController *vc = [story instantiateViewControllerWithIdentifier:@"List"];

    vc.urlstr=self.urlstr;
    [self addChildViewController:vc];
    vc.tableView.frame=CGRectMake(0,150,S_WIDTH , S_HEIGHT-150);
    [self.view addSubview:vc.tableView];
    [vc.tableView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         //配置具体的约束信息。
         //Masonry 中的属性和 NSLayoutAttrubute 的对应关系请参考图 ‘Masonry属性和NSLayoutAttrubute对照表.jpg’。
         make.left.equalTo(self.view.mas_left).with.offset(0.0f);
         make.right.equalTo(self.view.mas_right).with.offset(0.0f);
         make.top.equalTo(self.view.mas_top).with.offset(64.0f);

         make.bottom.equalTo(self.view.mas_bottom).with.offset(0.0f);
     }];
        UIView *ve=[[UIView alloc]initWithFrame:CGRectMake(0, 0, vc.tableView.frame.size.width, 180)];
    
    
   
    
    
        UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 80);
        [ve addSubview:demoContainerView];
   __block SDCycleScrollView *cycleScrollView2 =nil;
    
    NSMutableArray *uirlArr=[NSMutableArray array];
    [SingletonManager GXMenulisturl:@"http://www.app4life.mobi/adslist.php?device=iPhone&from=com.ipadown.nrbjkt&version=4.0&size=600x260&count=5" completion:^(NSMutableArray *dic) {
        
        
        // 情景二：采用网络图片实现
        NSMutableArray *imagesURLStrings =[NSMutableArray array];
        // 情景三：图片配文字
        NSMutableArray *titles =[NSMutableArray array];
        for (int i=0; i<dic.count; i++)
        {
            NSDictionary *dicstr=dic[i];
            [imagesURLStrings addObject:[dicstr objectForKey:@"thumb"]];
            [titles addObject:[dicstr objectForKey:@"title"]];
            [uirlArr addObject:[dicstr objectForKey:@"goto"]];
        }
        
        
        
        
        
        // 网络加载 --- 创建带标题的图片轮播器
        cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, vc.tableView.frame.size.width, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        cycleScrollView2.titlesGroup = titles;
        cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        [demoContainerView addSubview:cycleScrollView2];
        
        //         --- 模拟加载延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
        });
        cycleScrollView2.clickItemOperationBlock = ^(NSInteger index) {
            
            URlViewController *urlVC=[[URlViewController alloc]init];
            urlVC.uirlstr=uirlArr[(long)index];
            [self.navigationController pushViewController:urlVC animated:YES];

        };
        
        
        
        
        
        
    }];

    
    
    
    
    
    
    
    
    
    
        vc.tableView.tableHeaderView=ve;
    

    
}


@end
