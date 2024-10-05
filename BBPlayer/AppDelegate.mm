//
//  AppDelegate.m
//  BBPlayer
//
//  Created by Nik Rudenko on 9/12/17.
//
//

#import "AppDelegate.h"
#import <GLKit/GLKit.h>
#import <BBRuntime/BBRuntimeShared.h>
#import <AOBAnalyticsReporting/AOBAnalyticsReporting.h>

// You can uncomment this file to use Swift code
//#import <BBPlayer-Swift.h>

/* AppTrackingTransparency */
#import <AppTrackingTransparency/ATTrackingManager.h>
/* AppTrackingTransparency */

@interface AppDelegate  ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#ifndef DEBUG
    NSString *bbVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"BBVersion"];
    AOBInitializeReporting(bbVersion ? bbVersion : @"0.0.0");
#endif
    AOBStartSessionReporting();
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    BBRuntimeShared::instance()->resignActive();
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    BBRuntimeShared::instance()->enterBackground();
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    BBRuntimeShared::instance()->enterForeground();
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    BBRuntimeShared::instance()->becomeActive();
}

- (void)applicationWillTerminate:(UIApplication *)application {
    AOBStopSessionReporting();
}

-(void)showCustomFullscreenAd{
}

- (BOOL)needsTrackingRequest {
    /* AppTrackingTransparency */
    if (@available(iOS 14, *)) {
        return true;
    }
    else
    /* AppTrackingTransparency */
    {
        return false;
    }
}

- (void)requestTrackingWithCompletionHandler:(void(^)(bool))completionHandler {
    /* AppTrackingTransparency */
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            completionHandler(status == ATTrackingManagerAuthorizationStatusAuthorized);
        }];
    }
    /* AppTrackingTransparency */
}

- (void)loadingDidComplete {
    BBRuntimeShared::instance()->didLoad();
}

- (void)screenOnEnter:(NSString*)name {
}

- (void)screenOnExit:(NSString*)name {
}

- (void)sceneOnEnter:(NSString*)name {
}

- (void)sceneOnExit:(NSString*)name {
}

- (void)buttonActivated:(NSString*)name {
}

- (bool)buttonVisible:(NSString*)name {
    return true;
}

@end
