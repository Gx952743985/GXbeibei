//
//  URlViewController.m
//  Man
//
//  Created by 耿鑫 on 16/3/6.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "URlViewController.h"
#import "MBProgressHUD.h"



#import <ShareSDK/ShareSDK.h>
#import <ShareSDKExtension/SSEShareHelper.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import <ShareSDKUI/SSUIShareActionSheetStyle.h>
#import <ShareSDKUI/SSUIShareActionSheetCustomItem.h>
#import <ShareSDK/ShareSDK+Base.h>

#import <ShareSDKExtension/ShareSDK+Extension.h>






#define S_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds) //屏幕宽度
#define S_HEIGHT CGRectGetHeight([UIScreen mainScreen].bounds) //屏幕高度
#define App_ZTHEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高
#define APP_DHHEIGHT self.navigationController.navigationBar.frame.size.height //导航栏高
@interface URlViewController ()<UIWebViewDelegate>
{
    UIActivityIndicatorView        *act;
    UIWebView                      *web ;
    MBProgressHUD                  *hub;
}
///**
// *  是否开启摇一摇分享
// */
//@property (nonatomic) BOOL enableShakeShare;
//
/**
 *  表格视图
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 *  面板
 */
@property (nonatomic, strong) UIView *panelView;

/**
 *  加载视图
 */
@property (nonatomic, strong) UIActivityIndicatorView *loadingView;

@end

@implementation URlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //加载等待视图
    self.panelView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.panelView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.panelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    
    self.loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.loadingView.frame = CGRectMake((self.view.frame.size.width - self.loadingView.frame.size.width) / 2, (self.view.frame.size.height - self.loadingView.frame.size.height) / 2, self.loadingView.frame.size.width, self.loadingView.frame.size.height);
    self.loadingView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.panelView addSubview:self.loadingView];

    
    //loading框
    hub=[[MBProgressHUD alloc]initWithView:self.view];
    //位置不写的时候位置是自动屏幕中间
    hub.yOffset=100.0f;
    hub.xOffset=100.0f;
    
    hub.labelText=@"正在加载网页";
    hub.mode=MBProgressHUDModeIndeterminate;
    [self.view addSubview:hub];
  
    

    
    
    
    
    UIButton *butt =[UIButton buttonWithType:UIButtonTypeCustom];
    [butt setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [butt addTarget:self action:@selector(showShareEditor) forControlEvents:UIControlEventTouchUpInside];
       //    设置大小
    butt.frame = CGRectMake(100, 1000, 30, 30 );

    UIBarButtonItem *leftltem = [[UIBarButtonItem alloc]initWithCustomView:butt];
    self.navigationItem.rightBarButtonItem=leftltem;
 
    //    窗口web对象
    web =  [[UIWebView alloc]initWithFrame:CGRectMake(0,0, 320, S_HEIGHT)];
    
    
    web.backgroundColor = [UIColor yellowColor];
    //    web.scrollView.bounces = NO;
    //    web.scrollView.backgroundColor = [UIColor  redColor];
    NSURL *url = [NSURL URLWithString:_uirlstr];
    //    把一个URL 转换成NSURLRequest
    NSURLRequest  *request  = [NSURLRequest requestWithURL:url];
    //   load Request 加载请求
    [web loadRequest:request];
    //    透明度
    web.opaque = YES;
    
    //    自适应页面
//    web.scalesPageToFit = YES;
    
    
    
    //    实现代理
    
    web.delegate  = self;
    [self.view addSubview:web];
    
    
    act = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    //菊花
    act.center = self.view.center;
    
    act.color = [UIColor redColor];
    
    [self.view addSubview:act];
    

}

//应该开始加载请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    [hub show:YES];      //显示lodading框
    
    
    [act startAnimating ];

    
    return YES;
}
//

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [act stopAnimating];
    [hub hide:YES];       //关掉loading框

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //加载失败
    [act stopAnimating];
    NSLog(@"error --- %@",error);
}
- (IBAction)openURL:(UIButton *)sender {
    //返回
    [web goBack];
    
    //    设为网络状态
    //    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    //    加载 链接
    //    NSURL  *url = [NSURL URLWithString:@"http://www.baidu.com"];
    //    [[UIApplication sharedApplication] openURL:url];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 内容编辑界面

/**
 *  显示分享编辑界面
 */
- (void)showShareEditor
{
    __weak URlViewController *theController = self;
    
    //创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"1.jpg"]];
    
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:_uirlstr]
                                          title:@"通过自制软件分享"
                                           type:SSDKContentTypeImage];
        
        [ShareSDK showShareEditor:SSDKPlatformTypeSinaWeibo
               otherPlatformTypes:@[@(SSDKPlatformTypeTencentWeibo), @(SSDKPlatformTypeWechat),
                   
]
                      shareParams:shareParams
              onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end)
         {
             
             switch (state) {
                     
                 case SSDKResponseStateBegin:
                 {
                     [theController showLoadingView:YES];
                     break;
                 }
                 case SSDKResponseStateSuccess:
                 {
                     UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                         message:nil
                                                                        delegate:nil
                                                               cancelButtonTitle:@"确定"
                                                               otherButtonTitles:nil];
                     [alertView show];
                     break;
                 }
                 case SSDKResponseStateFail:
                 {
                     UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                         message:[NSString stringWithFormat:@"%@", error]
                                                                        delegate:nil
                                                               cancelButtonTitle:@"确定"
                                                               otherButtonTitles:nil];
                     [alertView show];
                     break;
                 }
                 case SSDKResponseStateCancel:
                 {
                     UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享已取消"
                                                                         message:nil
                                                                        delegate:nil
                                                               cancelButtonTitle:@"确定"
                                                               otherButtonTitles:nil];
                     [alertView show];
                     break;
                 }
                 default:
                     break;
             }
             
             if (state != SSDKResponseStateBegin)
             {
                 [theController showLoadingView:NO];
                 [theController.tableView reloadData];
             }
         }];
    }
}

#pragma mark -

/**
 *  显示加载动画
 *
 *  @param flag YES 显示，NO 不显示
 */
- (void)showLoadingView:(BOOL)flag
{
    if (flag)
    {
        [self.view addSubview:self.panelView];
        [self.loadingView startAnimating];
    }
    else
    {
        [self.panelView removeFromSuperview];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
