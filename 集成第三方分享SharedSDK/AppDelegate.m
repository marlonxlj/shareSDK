//
//  AppDelegate.m
//  集成第三方分享SharedSDK
//
//  Created by m on 2016/11/23.
//  Copyright © 2016年 XLJ. All rights reserved.
//

#import "AppDelegate.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import <WeiboSDK.h>


static const NSString *WeiBoAppID = @"1068399336";
static const NSString *BundleID = @"com.rockhippo.trainMate";
static const NSString *WeiBoAppKey = @"1709086661";
static const NSString *WeiBoAppSecret = @"b5cc2f7160241cc031792e1dd39ee8bd";
static const NSString *WeiBoCallBackURL = @"http://m.wonaonao.com/weibo/callback.php";

static const NSString *SharedSDKAppKey = @"194cdf4334b20";
static const NSString *SharedAppSecret = @"82df2018e1e178c71aeb8e53d7faf580";


//58368d6545297d3289001542

//#import <UMSocialCore/UMSocialCore.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    [ShareSDK registerApp:@"194cdf4334b20" activePlatforms:@[@(SSDKPlatformTypeSinaWeibo)] onImport:^(SSDKPlatformType platformType) {
        switch (platformType) {
            case SSDKPlatformTypeUnknown: {
                
                break;
            }
            case SSDKPlatformTypeSinaWeibo: {
                [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                break;
            }
            
        }
    } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
        switch (platformType) {
            case SSDKPlatformTypeUnknown: {
                
                break;
            }
            case SSDKPlatformTypeSinaWeibo: {
                
                //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                [appInfo SSDKSetupSinaWeiboByAppKey:@"1709086661" appSecret:@"b5cc2f7160241cc031792e1dd39ee8bd" redirectUri:@"http://m.wonaonao.com/weibo/callback.php" authType:SSDKAuthTypeBoth];
                
                break;
            }
            case SSDKPlatformTypeTencentWeibo: {
                
                break;
            }
            case SSDKPlatformTypeDouBan: {
                
                break;
            }
            case SSDKPlatformSubTypeQZone: {
                
                break;
            }
            case SSDKPlatformTypeRenren: {
                
                break;
            }
            case SSDKPlatformTypeKaixin: {
                
                break;
            }
            case SSDKPlatformTypeFacebook: {
                
                break;
            }
            case SSDKPlatformTypeTwitter: {
                
                break;
            }
            case SSDKPlatformTypeYinXiang: {
                
                break;
            }
            case SSDKPlatformTypeGooglePlus: {
                
                break;
            }
            case SSDKPlatformTypeInstagram: {
                
                break;
            }
            case SSDKPlatformTypeLinkedIn: {
                
                break;
            }
            case SSDKPlatformTypeTumblr: {
                
                break;
            }
            case SSDKPlatformTypeMail: {
                
                break;
            }
            case SSDKPlatformTypeSMS: {
                
                break;
            }
            case SSDKPlatformTypePrint: {
                
                break;
            }
            case SSDKPlatformTypeCopy: {
                
                break;
            }
            case SSDKPlatformSubTypeWechatSession: {
                
                break;
            }
            case SSDKPlatformSubTypeWechatTimeline: {
                
                break;
            }
            case SSDKPlatformSubTypeQQFriend: {
                
                break;
            }
            case SSDKPlatformTypeInstapaper: {
                
                break;
            }
            case SSDKPlatformTypePocket: {
                
                break;
            }
            case SSDKPlatformTypeYouDaoNote: {
                
                break;
            }
            case SSDKPlatformTypePinterest: {
                
                break;
            }
            case SSDKPlatformTypeFlickr: {
                
                break;
            }
            case SSDKPlatformTypeDropbox: {
                
                break;
            }
            case SSDKPlatformTypeVKontakte: {
                
                break;
            }
            case SSDKPlatformSubTypeWechatFav: {
                
                break;
            }
            case SSDKPlatformSubTypeYiXinSession: {
                
                break;
            }
            case SSDKPlatformSubTypeYiXinTimeline: {
                
                break;
            }
            case SSDKPlatformSubTypeYiXinFav: {
                
                break;
            }
            case SSDKPlatformTypeMingDao: {
                
                break;
            }
            case SSDKPlatformTypeLine: {
                
                break;
            }
            case SSDKPlatformTypeWhatsApp: {
                
                break;
            }
            case SSDKPlatformSubTypeKakaoTalk: {
                
                break;
            }
            case SSDKPlatformSubTypeKakaoStory: {
                
                break;
            }
            case SSDKPlatformTypeFacebookMessenger: {
                
                break;
            }
            case SSDKPlatformTypeAliPaySocial: {
                
                break;
            }
            case SSDKPlatformTypeAliPaySocialTimeline: {
                
                break;
            }
            case SSDKPlatformTypeYiXin: {
                
                break;
            }
            case SSDKPlatformTypeKakao: {
                
                break;
            }
            case SSDKPlatformTypeEvernote: {
                
                break;
            }
            case SSDKPlatformTypeWechat: {
                
                break;
            }
            case SSDKPlatformTypeQQ: {
                
                break;
            }
            case SSDKPlatformTypeAny: {
                
                break;
            }
        }
    }];
    
    /*
    //打开日志
    [[UMSocialManager defaultManager] openLog:YES];
    //设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"58368d6545297d3289001542"];
    
    // 获取友盟social版本号
//    NSLog(@"UMeng social version: %@", [UMSocialGlobal umSocialSDKVersion]);
    
    //设置新浪的appId和appKey
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"1709086661"  appSecret:@"b5cc2f7160241cc031792e1dd39ee8bd" redirectURL:@"http://m.wonaonao.com/weibo/callback.php"];
    */
    
    return YES;
}

/*
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        
    }
    return result;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        
    }
    return result;
}
*/

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
