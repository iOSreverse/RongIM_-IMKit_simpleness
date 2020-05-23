//
//  AppDelegate.m
//  RongIM_-IMKit_simpleness
//
//  Created by wdw on 2020/5/16.
//  Copyright © 2020 wdw. All rights reserved.
//

#import "AppDelegate.h"
#import "DWConversationListViewController.h"
#import <RongIMKit/RongIMKit.h>

@interface AppDelegate ()<RCIMUserInfoDataSource>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    DWConversationListViewController *vc = [[DWConversationListViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;

    [self initRongIM];

    return YES;
}

- (void)initRongIM {
    [[RCIM sharedRCIM] initWithAppKey:rongIMAppkey];

    //服务端获取
    NSString *TOKEN = @"F7Y3kzrUU21eKNON8D726ceqTo3rB1xXYAyTF2o42hLgHehAKaQXnWoaHdHjuYyc@p6bj.cn.rongnav.com;p6bj.cn.rongcfg.com";
    [[RCIM sharedRCIM] connectWithToken:TOKEN
                                success:^(NSString *userId) {
        NSLog(@"userId:%@", userId);
        dispatch_async(dispatch_get_main_queue(), ^{
                           [self setCurrentUserInfo:userId];
                       });
    }
                                  error:^(RCConnectErrorCode status) {
        NSLog(@"status:%ld", status);
    }
                         tokenIncorrect:^{
        NSLog(@"tokenIncorrect");
    }];

    [[RCIM sharedRCIM] setUserInfoDataSource:self];
}

//自己的头像
- (void)setCurrentUserInfo:(NSString *)userId {
    RCUserInfo *userInfo = [[RCUserInfo alloc] initWithUserId:userId name:@"调皮的悟空" portrait:@"http://carimg.juzixinche.com/install/images/20191220/20191220171801ioZadag5.jpg"];
    [RCIM sharedRCIM].currentUserInfo = userInfo;
}

//好友的头像
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion {
    if ([userId isEqualToString:@"123456788"]) {
        RCUserInfo *userInfo = [[RCUserInfo alloc] initWithUserId:@"123456788" name:@"夏明" portrait:@"http://carimg.juzixinche.com/jzxc/20200227/20200227181918Xa3uvKCy.jpg"];

        if (completion) {
            completion(userInfo);
        }
    }
}

@end
