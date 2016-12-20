//
//  ViewController.m
//  集成第三方分享SharedSDK
//
//  Created by m on 2016/11/23.
//  Copyright © 2016年 XLJ. All rights reserved.
//

#import "ViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKExtension/SSEShareHelper.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import <ShareSDKUI/SSUIShareActionSheetStyle.h>
#import <ShareSDKUI/SSUIShareActionSheetCustomItem.h>
#import <ShareSDK/ShareSDK+Base.h>

#import <ShareSDKExtension/ShareSDK+Extension.h>
#import <MOBFoundation/MOBFoundation.h>

#import <ShareSDKConfigFile/ShareSDK+XML.h>


//#import <UMSocialCore/UMSocialCore.h>
//webview请求
#define HttpsWebView @"https://m.wonaonao.com/hello.html"
@interface ViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ViewController

- (IBAction)webViewLoading:(id)sender {
 
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:HttpsWebView]]];
    
}

- (IBAction)startShared:(id)sender {
    [self platShare];
    
//    [self umMessage];
    //分享内容
//    [self shareContent:UMSocialPlatformType_Sina];
    
    //网页
//    [self shareWebPageToPlatformType:UMSocialPlatformType_Sina];
    
    
//    [self shareImageAndTextToPlatformType:UMSocialPlatformType_Sina];
    
//    [self shareByContentNameWithCustomField];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)platShare
{
    /**
     * 在定制平台内容分享中，除了设置共有的分享参数外，还可以为特定的社交平台进行内容定制，
     * 如：其他平台分享的内容为“分享内容”，但新浪微博需要在原有的“分享内容”文字后面加入一条链接，则可以如下做法：
     **/
    __weak ViewController *theController = self;
//    [theController showLoadingView:YES];
    
    //创建分享参数
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    
//    NSArray* imageArray = @[[UIImage imageNamed:@"testPage"]];
    NSArray *imageArray = @[@"http://www.mob.com/images/logo_black.png"];
//    NSArray *imageArray = @[@"http://upload-images.jianshu.io/upload_images/1819746-dd128b903b5167b7.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];

    if (imageArray) {
        
        [shareParams SSDKSetupShareParamsByText:@"我是来自火星的妹妹 http://www.baidu.com"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://www.qq.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeImage];
        
//        [shareParams SSDKSetupSinaWeiboShareParamsByText:@"你是来自星星的你，我是天王星 http://www.baidu.com"
//                                                   title:@"分享标题哈哈"
//                                                   image:[UIImage imageNamed:@"testPage"]
//                                                     url:[NSURL URLWithString:@"http://www.qq.com"]
//                                                latitude:0
//                                               longitude:0
//                                                objectID:nil
//                                                    type:SSDKContentTypeImage];
//
        
        //进行分享
        [ShareSDK share:SSDKPlatformTypeSinaWeibo
             parameters:shareParams
         onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
             
             switch (state) {
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
//             
//             [theController showLoadingView:NO];
//             [theController.tableView reloadData];
//             
         }];
    }
     
     
}

/*
- (void)umMessage
{
    //如果需要获得用户信息直接跳转的话，需要先取消授权
    //step1 取消授权
    [[UMSocialManager defaultManager] cancelAuthWithPlatform:UMSocialPlatformType_Sina completion:^(id result, NSError *error) {
        
        //step2 获得用户信息(获得用户信息中包含检查授权的信息了)
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_Sina currentViewController:self completion:^(id result, NSError *error) {
            
            NSString *message = nil;
            
            if (error) {
                message = @"Get user info fail";
                UMSocialLogInfo(@"Get user info fail with error %@",error);
            }else{
                if ([result isKindOfClass:[UMSocialUserInfoResponse class]]) {
                    UMSocialUserInfoResponse *resp = result;
                    // 授权信息
                    UMSocialLogInfo(@"UserInfoAuthResponse uid: %@", resp.uid);
                    UMSocialLogInfo(@"UserInfoAuthResponse accessToken: %@", resp.accessToken);
                    UMSocialLogInfo(@"UserInfoAuthResponse refreshToken: %@", resp.refreshToken);
                    UMSocialLogInfo(@"UserInfoAuthResponse expiration: %@", resp.expiration);
                    
                    // 用户信息
                    UMSocialLogInfo(@"UserInfoResponse name: %@", resp.name);
                    UMSocialLogInfo(@"UserInfoResponse iconurl: %@", resp.iconurl);
                    UMSocialLogInfo(@"UserInfoResponse gender: %@", resp.gender);
                    
                    // 第三方平台SDK源数据,具体内容视平台而定
                    UMSocialLogInfo(@"OriginalUserProfileResponse: %@", resp.originalResponse);
                    
                    message = [NSString stringWithFormat:@"name: %@\n icon: %@\n gender: %@\n",resp.name,resp.iconurl,resp.gender];
                    
                    //授权成功
                    [self shareContent:UMSocialPlatformType_Sina];
                }else{
                    message = @"Get user info fail";
                    UMSocialLogInfo(@"Get user info fail with  unknow error");
                }
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UserInfo"
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"sure", @"确定")
                                                  otherButtonTitles:nil];
            [alert show];
        }];
    }];

}

- (void)shareContent:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    messageObject.text = @"我是分享来自星星的你";
    
    //分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id result, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([result isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = result;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",result);
            }

        }
        [self alertWithError:error];

    }];
}
- (void)alertWithError:(NSError *)error
{
    NSString *result = nil;
    if (!error) {
        result = [NSString stringWithFormat:@"Share succeed"];
    }
    else{
        if (error) {
            result = [NSString stringWithFormat:@"Share fail with error code: %d\n",(int)error.code];
        }
        else{
            result = [NSString stringWithFormat:@"Share fail"];
        }
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"share"
                                                    message:result
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"sure", @"确定")
                                          otherButtonTitles:nil];
    [alert show];
}

//网页分享
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    //    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"分享标题" descr:@"分享内容描述" thumImage:[UIImage imageNamed:@"icon"]];
    NSString* thumbURL =  @"http://weixintest.ihk.cn/ihkwx_upload/heji/material/img/20160414/1460616012469.jpg";
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"分享标题1" descr:@"分享内容描述1" thumImage:thumbURL];
    
    //设置网页地址
    shareObject.webpageUrl =@"http://www.baidu.com";
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        [self alertWithError:error];
    }];
}

//分享图片和文字
- (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //设置文本
    messageObject.text = @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。";
    
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = [UIImage imageNamed:@"icon"];
    NSString* thumbURL =  @"http://dev.umeng.com/images/tab2_1.png";
    shareObject.shareImage = thumbURL;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        [self alertWithError:error];
    }];
}

*/

//弹出列表方法presentSnsIconSheetView需要设置delegate为self
-(BOOL)isDirectShareInIconActionSheet
{
    return YES;
}

- (void)shareByContentNameWithCustomField
{
    //根据项目中的配置文件ShareContent.xml的配置内容进行分享(本分享方法不含任何UI)
    
    //分享的内容会按照传入的contentName搜索对应的ShareContent.xml中的<Content>节点之name属性
    //使用以下接口请注意:
    
    //1.比需在项目中存在ShareContent.xml 文件，且符合xml文件格式, <Content>节点之name 属性填上您的标识
    
    //2.在下面接口的首个参数传入对应的<Content>节点的name
    
    //3.(可选)通过自定义一本字典,并定义其key和value。其中value的值为你在ShareContent.xml文件中<Content>节点中以"{}"括起来的内容。
    //例如 :NSDictionary *customFields = @{@"imgUrl" : imgPath};
    //那么 节点中某个地方就应该使用 "{imgUrl}",两边字段一旦吻合,imgPath 就会替代 "{imgUrl}"中的内容(大括号也会被取代)
    //通过此种方式，就可以实现任意自定义字段的替换;你也可以随时动态改变传如的customFields 字典，来实现动态的分享内容的改变。
    
    NSString *imgPath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"jpg"];
    
    if (imgPath)
    {
        NSDictionary *customFields = @{@"imgUrl" : imgPath,
                                       @"url" : @"http://mob.com"};
        
        [ShareSDK shareWithContentName:@"ShareSDK"
                              platform:SSDKPlatformTypeSinaWeibo
                          customFields:customFields
                        onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                            
                            switch (state)
                            {
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
                        }];
    }
}




@end
