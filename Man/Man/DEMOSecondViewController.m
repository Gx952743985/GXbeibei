//
//  DEMOSecondViewController.m
//  RESideMenuExample
//
//  Created by Roman Efimov on 10/10/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOSecondViewController.h"
#import "ListTableViewController.h"
@implementation DEMOSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=_strtitle;
      [self.navigationController.navigationBar setBarTintColor:[UIColor brownColor]];
	self.title =_strtitle;
    
//    self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:202/255.0 blue:101/255.0 alpha:1.0];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left"
//                                                                             style:UIBarButtonItemStylePlain
//                                                                            target:self
//                                                                            action:@selector(presentLeftMenuViewController:)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    设置大小
    button.frame = CGRectMake(100, 1000, 30, 30 );
    [button setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:button];

    
//    [self.view addSubview:({
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        button.frame = CGRectMake(0, 84, self.view.frame.size.width, 44);
//        button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//        [button setTitle:@"Push View Controller" forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(pushViewController:) forControlEvents:UIControlEventTouchUpInside];
//        button;
//    })];
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ListTableViewController *vc = [story instantiateViewControllerWithIdentifier:@"List"];
    
    vc.urlstr=self.strurl;
    [self addChildViewController:vc];
 [self.view addSubview:vc.tableView];
    
    
}

//- (void)pushViewController:(id)sender
//{
//    UIViewController *viewController = [[UIViewController alloc] init];
//    viewController.title = @"Pushed Controller";
//    viewController.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController pushViewController:viewController animated:YES];
//}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    NSLog(@"DEMOSecondViewController will appear");
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    NSLog(@"DEMOSecondViewController will disappear");
//}

@end
