//
//  MoreTableViewController.m
//  Man
//
//  Created by 耿鑫 on 16/3/5.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "MoreTableViewController.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
@interface MoreTableViewController ()
@property(nonatomic,retain)NSArray *strArr;
@property(nonatomic,retain)NSArray *imgArr;
@property(nonatomic,retain)UILabel *lable;
@end

@implementation MoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        _lable =[[UILabel alloc]initWithFrame:CGRectZero];
    
    
    _strArr=[NSArray arrayWithObjects:@"关于我们",@"意见建议",@"为我们打分", nil];
    _imgArr=[NSArray arrayWithObjects:@"plugin_icon_info",@"plugin_icon_message",@"plugin_icon_rated", nil];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    设置大小
    button.frame = CGRectMake(100, 1000, 30, 30 );
    [button setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:button];
   self.tableView =[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    //设置区头高度
//  self.tableView.sectionHeaderHeight = 100;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return  3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==2) {
        return 3;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text=@"ddd";
    switch (indexPath.section) {
         case 0:
            cell.imageView.image=[UIImage imageNamed:@"plugin_icon_star"];
            cell.textLabel.text=@"个人收藏";
        
        break;
            
        case 1:
        {
            cell.imageView.image=[UIImage imageNamed:@"plugin_icon_setting"];
            cell.textLabel.text=@"清空缓存";
           
            _lable.text=[NSString stringWithFormat:@"%.2fKB", (unsigned long)[[SDImageCache sharedImageCache] getSize]/1000.0];
            _lable.textAlignment=NSTextAlignmentRight;
            [cell.contentView addSubview:_lable];
            [_lable mas_makeConstraints:^(MASConstraintMaker *make)
             {
                 //配置具体的约束信息。
                 //Masonry 中的属性和 NSLayoutAttrubute 的对应关系请参考图 ‘Masonry属性和NSLayoutAttrubute对照表.jpg’。
                 make.left.equalTo(cell.contentView.mas_left).with.offset(80.0f);
                 make.right.equalTo(cell.contentView.mas_right).with.offset(-10.0f);
                 make.top.equalTo(cell.contentView.mas_top).with.offset(10.0f);
                 make.bottom.equalTo(cell.contentView.mas_bottom).with.offset(-10.0f);
             }];
            
        }
            break;
            
        case 2:
            
            cell.imageView.image=[UIImage imageNamed:_imgArr[indexPath.row]];
            cell.textLabel.text=_strArr[indexPath.row];

        
            
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSArray *arr=[NSArray arrayWithObjects:@"个人收藏",@"系统设置",@"建议反馈", nil];

    return  arr[section];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        
        [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeSinaWeibo
                                       onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                           
                                           //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
                                           //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
                                           associateHandler (user.uid, user, user);
                                           NSLog(@"dd%@",user.rawData);
                                           NSLog(@"dd%@",user.credential);
                                           
                                       }
                                    onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                        
                                        if (state == SSDKResponseStateSuccess)
                                        {
                                            NSLog(@"登陆成功");
                                        }
                                        
                                    }];
        
//        [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo
//               onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
//         {
//             if (state == SSDKResponseStateSuccess)
//             {
//                 
//                 NSLog(@"uid=%@",user.uid);
//                 NSLog(@"%@",user.credential);
//                 NSLog(@"token=%@",user.credential.token);
//                 NSLog(@"nickname=%@",user.nickname);
//             }
//             
//             else
//             {
//                 NSLog(@"%@",error);
//             }
//             
//         }];
//        
        
        
        
    }
    if (indexPath.section==1) {
        [[SDImageCache sharedImageCache] clearDisk ];
        [self.tableView reloadData];
    }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
