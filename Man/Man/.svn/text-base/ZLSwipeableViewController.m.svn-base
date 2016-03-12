//
//  ViewController.m
//  ZLSwipeableViewDemo
//
//  Created by Zhixuan Lai on 11/1/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

#import "ZLSwipeableViewController.h"
#import "UIColor+FlatColors.h"
#import "CardView.h"

@interface ZLSwipeableViewController ()
{
    int a;
}
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic) NSUInteger colorIndex;

@property (nonatomic) BOOL loadCardFromXib;
@property (strong, readonly, nonatomic) RESideMenu *sideMenuViewController;
@property (nonatomic, strong) UIBarButtonItem *reloadBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *leftBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *upBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *downBarButtonItem;
@end

@implementation ZLSwipeableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    - (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
    
    self.title = @"First Controller";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(presentLeftMenuViewController:)];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.image = [UIImage imageNamed:@"Balloon"];
    [self.view addSubview:imageView];
    
    
    
    [self actionSheet:nil clickedButtonAtIndex:1];
    self.navigationController.toolbarHidden = NO;
    self.view.clipsToBounds = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    a=0;
    // Do any additional setup after loading the view, typically from a nib.
    self.colorIndex = 0;
    self.colors = @[
        @"Turquoise",
        @"Green Sea",
        @"Emerald",
        @"Nephritis",
        @"Peter River",
        @"Belize Hole",
        @"Amethyst",
        @"Wisteria",
        @"Wet Asphalt",
        @"Midnight Blue",
        @"Sun Flower",
        @"Orange",
        @"Carrot",
        @"Pumpkin",
        @"Alizarin",
        @"Pomegranate",
        @"Clouds",
        @"Silver",
        @"Concrete",
        @"Asbestos"
    ];
//
//    self.reloadBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Reload"
//                                                                style:UIBarButtonItemStylePlain
//                                                               target:self
//                                                               action:@selector(handleReload:)];
//    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"←"
//                                                              style:UIBarButtonItemStylePlain
//                                                             target:self
//                                                             action:@selector(handleLeft:)];
//    self.upBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"↑"
//                                                            style:UIBarButtonItemStylePlain
//                                                           target:self
//                                                           action:@selector(handleUp:)];
//    self.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"→"
//                                                               style:UIBarButtonItemStylePlain
//                                                              target:self
//                                                              action:@selector(handleRight:)];
//    self.downBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"↓"
//                                                              style:UIBarButtonItemStylePlain
//                                                             target:self
//                                                             action:@selector(handleDown:)];
//
//    UIBarButtonItem *fixedSpace =
//        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                                      target:nil
//                                                      action:nil];
//    UIBarButtonItem *flexibleSpace =
//        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
//                                                      target:nil
//                                                      action:nil];
//    self.toolbarItems = @[
//        fixedSpace,
//        _reloadBarButtonItem,
//        flexibleSpace,
//        _leftBarButtonItem,
//        flexibleSpace,
//        _upBarButtonItem,
//        flexibleSpace,
//        _rightBarButtonItem,
//        flexibleSpace,
//        _downBarButtonItem,
//        fixedSpace
//    ];

    ZLSwipeableView *swipeableView = [[ZLSwipeableView alloc] initWithFrame:CGRectZero];
    self.swipeableView = swipeableView;
    [self.view addSubview:self.swipeableView];

    // Required Data Source
   self.swipeableView.dataSource = self;

    // Optional Delegate
//    self.swipeableView.delegate = self;

    self.swipeableView.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *metrics = @{};

    [self.view addConstraints:[NSLayoutConstraint
                                  constraintsWithVisualFormat:@"|-50-[swipeableView]-50-|"
                                                      options:0
                                                      metrics:metrics
                                                        views:NSDictionaryOfVariableBindings(
                                                                  swipeableView)]];

    [self.view addConstraints:[NSLayoutConstraint
                                  constraintsWithVisualFormat:@"V:|-120-[swipeableView]-100-|"
                                                      options:0
                                                      metrics:metrics
                                                        views:NSDictionaryOfVariableBindings(
                                                                  swipeableView)]];
}


- (IBAction)presentLeftMenuViewController:(id)sender
{
//    sideMenuViewController
    [self.sideMenuViewController presentLeftMenuViewController];
}
- (void)viewDidLayoutSubviews {
    [self.swipeableView loadViewsIfNeeded];
}
#pragma mark - Action

- (void)handleLeft:(UIBarButtonItem *)sender {
    [self.swipeableView swipeTopViewToLeft];
}

- (void)handleRight:(UIBarButtonItem *)sender {
    [self.swipeableView swipeTopViewToRight];
}

- (void)handleUp:(UIBarButtonItem *)sender {
    [self.swipeableView swipeTopViewToUp];
}

- (void)handleDown:(UIBarButtonItem *)sender {
    [self.swipeableView swipeTopViewToDown];
}

- (void)handleReload:(UIBarButtonItem *)sender {
    UIActionSheet *actionSheet =
        [[UIActionSheet alloc] initWithTitle:@"Load Cards"
                                    delegate:self
                           cancelButtonTitle:@"Cancel"
                      destructiveButtonTitle:nil
                           otherButtonTitles:@"Programmatically", @"From Xib", nil];
    [actionSheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.loadCardFromXib = buttonIndex == 1;
    self.colorIndex = 0;
    [self.swipeableView discardAllViews];
    [self.swipeableView loadViewsIfNeeded];
}

#pragma mark - ZLSwipeableViewDelegate

- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction {
    NSLog(@"did swipe in direction: %zd", direction);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView didCancelSwipe:(UIView *)view {
    NSLog(@"did cancel swipe");
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
  didStartSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
          swipingView:(UIView *)view
           atLocation:(CGPoint)location
          translation:(CGPoint)translation {
    NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f", location.x, location.y,
          translation.x, translation.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didEndSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
}

#pragma mark - ZLSwipeableViewDataSource

- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
    if (self.colorIndex >= self.colors.count) {
        self.colorIndex = 0;
    }


        CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
        
        ///这里可以对每个设置
        //    UIImageView *imgh=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"0.JPG"]];
        //    imgh.frame=CGRectMake(imgh.frame.origin.x,imgh.frame.origin.y, CGRectGetWidth(imgh.frame), CGRectGetHeight(imgh.frame));
        //    [view addSubview:imgh];
#warning ----xie li xie view
        //这里写view上的东西
        
        view.backgroundColor = [self colorForName:self.colors[self.colorIndex]];
        self.colorIndex++;
        
        if (self.loadCardFromXib) {
            UIView *contentView =
            [[NSBundle mainBundle] loadNibNamed:@"CardContentView" owner:self options:nil][0];
            contentView.translatesAutoresizingMaskIntoConstraints = NO;
            [view addSubview:contentView];
            
            // This is important:
            // https://github.com/zhxnlai/ZLSwipeableView/issues/9
            NSDictionary *metrics =
            @{ @"height" : @(view.bounds.size.height),
               @"width" : @(view.bounds.size.width) };
            NSDictionary *views = NSDictionaryOfVariableBindings(contentView);
            [view addConstraints:[NSLayoutConstraint
                                  constraintsWithVisualFormat:@"H:|[contentView(width)]"
                                  options:0
                                  metrics:metrics
                                  views:views]];
            [view addConstraints:[NSLayoutConstraint
                                  constraintsWithVisualFormat:@"V:|[contentView(height)]"
                                  options:0
                                  metrics:metrics
                                  views:views]];
        }
        return view;

    
    
   

  }

#pragma mark - ()

- (UIColor *)colorForName:(NSString *)name {
    NSString *sanitizedName = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *selectorString = [NSString stringWithFormat:@"flat%@Color", sanitizedName];
    Class colorClass = [UIColor class];
    return [colorClass performSelector:NSSelectorFromString(selectorString)];
}

@end
