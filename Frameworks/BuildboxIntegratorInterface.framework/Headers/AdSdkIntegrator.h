//
//  AdSdkIntegrator.h
//  BuildboxIntegratorInterface
//
//  Created by Takaji Messer on 5/5/21.
//  Copyright © 2021 AppOnboard. All rights reserved.
//

#ifndef AdSdkIntegrator_h
#define AdSdkIntegrator_h

#import "SdkIntegrator.h"
#import "AdSdkListener.h"

// AP: matches with PTAdController.h
typedef enum : NSUInteger {
    kLoadStateNone = 0,
    kLoadStateWaiting = 1,
    kLoadStateLoading = 2,
    kLoadStateFailed = 3,
    kLoadStateLoaded = 4
} PTAdControllerLoadState;

@interface AdSdkIntegrator : SdkIntegrator
@property(weak) UIViewController *adParentViewController;

@property(readonly, nonatomic, strong) id<AdSdkListener> listener;

- (id)initWithListener:(id<AdSdkListener>)listener;

- (void)initBanner;
- (BOOL)showBanner;
- (void)hideBanner;
- (BOOL)isBannerVisible;

- (void)initInterstitial;
- (BOOL)showInterstitial;

- (void)initRewardedVideo;
- (BOOL)showRewardedVideo;
- (BOOL)isRewardedVideoAvailable;

- (BOOL)sdkNeedsInit;
- (BOOL)sdkIsReady;
- (PTAdControllerLoadState)bannerLoadState;
- (PTAdControllerLoadState)interstitialLoadState;
- (PTAdControllerLoadState)rewardedVideoLoadState;

-(void)clearBannerLoadStateErrors;
-(void)clearInterstitialLoadStateErrors;
-(void)clearRewardedVideoLoadStateErrors;

@end

#endif /* AdSdkIntegrator_h */
