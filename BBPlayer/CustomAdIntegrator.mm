// 
// CustomAdIntegrator.mm
// BBPlayer
// 
// Edit this file to integrate a 3rd party ad network.
// 
// Update the methods in the "Initialization" section.
// Update the methods in the "Banner", "Interstitial", and "RewardedVideo" sections if supported in your ad network.
// Call the methods in the "AdCallbacks" section when appropriate.
// Leave any lines that begin with "[super" untouched.
// 
// NOTE: This class is ignored in the free version of Buildbox.
// 

#import <UIKit/UIKit.h>
#import "CustomAdIntegrator.h"

// TODO: Set to implemented ad network name here
#define CustomAdNetworkName @""

@interface CustomAdIntegrator() {
    PTAdControllerLoadState _sdkLoadState;
    PTAdControllerLoadState _bannerLoadState;
    PTAdControllerLoadState _interstitialLoadState;
    PTAdControllerLoadState _rewardedVideoLoadState;
    
    // TODO: add any more variables you need here for keeping track of loaded ads etc.
}
@end

@implementation CustomAdIntegrator

- (id)initWithListener:(id<AdSdkListener>)listener {
    if (self = [super initWithListener:listener]) {
        _sdkId = @"custom-ads";
        _logTag = @"Custom Ads";
        _sdkLoadState = kLoadStateNone;
        _bannerLoadState = kLoadStateNone;
        _interstitialLoadState = kLoadStateNone;
        _rewardedVideoLoadState = kLoadStateNone;
    }
    
    return self;
}

/**
 * Update the load states of the ad network sdk and each type of ad
 * A default implementation is provided throughout this file that will work for many networks,
 * but will also need adjustments in many cases.
 */
-(BOOL)sdkNeedsInit {
    if(_sdkLoadState == kLoadStateNone ||
       _sdkLoadState == kLoadStateWaiting ||
       _sdkLoadState == kLoadStateFailed) {
        return YES;
    }
    return NO;
}

-(BOOL)sdkIsReady {
    if(_sdkLoadState == kLoadStateLoaded) {
        return YES;
    }
    return NO;
}

/** 
 * Complete the following stubbed methods. They will be called automatically by the Buildbox player.
 */
#pragma mark Initialization

/**
 * Pass the consent result to your ad network. This method will be called when the user has decided to change their acceptance of a privacy policy.
 */
- (void)setUserConsent:(BOOL)consentGiven {
    [super setUserConsent:consentGiven];
}

/**
 * Initialize your ad network. Do not start loading ads here. This method should either call "sdkLoaded" or "sdkFailed" on completion.
 */
- (void)initSdkWithValues:(NSDictionary<NSString*, NSString*>*)keyValuePairs withViewController:(UIViewController*)viewController {
    [super initSdkWithValues:keyValuePairs withViewController:viewController];

    [self log:@"Custom ad integrator needs to be implemented!"];
    //[self sdkLoaded];
    [self sdkFailed];
}

/** 
 * Update these methods to implement banners with your ad network.
 */
#pragma mark Banner

/**
 * Load a banner.
 * If banner is one time use, then initialize a new one before loading.
 * Make sure the banner view starts as hidden (e.g. [_bannerView setHidden:YES]).
 * This method should either call "bannerLoaded" or "bannerFailed" on completion (e.g. [self bannerLoaded]).
 */
- (void)initBanner {
    [super initBanner];
}

/**
 * Show a banner. Returns whether a banner will show or not.
 */
- (BOOL)showBanner {
    return [super showBanner];
}

/**
 * Hide the banner.
 */
- (void)hideBanner {
    [super hideBanner];
}

/**
 * @return true if the banner is currently visible (e.g. return [_bannerView isHidden]).
 */
- (BOOL)isBannerVisible {
    return false;
}

/** 
 * Update these methods to implement interstitials with your ad network.
 */
#pragma mark Interstitial

/**
 * Load an interstitial ad.
 * This method should either call "interstitialLoaded" or "interstitialFailed" on completion (e.g. [self interstitialLoaded]).
 */
- (void)initInterstitial {
    [super initInterstitial];
}

/**
 * Show an interstitial. Returns whether a video will show or not.
 */
- (BOOL)showInterstitial {
    return [super showInterstitial];
}

/**
 * Update these methods to implement rewarded videos with your ad network.
 */
#pragma mark RewardedVideo

/**
 * Load a rewarded video.
 * This method should either call "rewardedVideoLoaded" or "rewardedVideoFailed" on completion (e.g. [self rewardedVideoLoaded]).
 */
- (void)initRewardedVideo {
    [super initRewardedVideo];
}

/**
 * Show a rewarded video. Returns whether a video will show or not.
 */
- (BOOL)showRewardedVideo {
    return [super showRewardedVideo];
}

/**
 * @return true if a rewarded video is loaded and ready to show.
 */
- (BOOL)isRewardedVideoAvailable {
    return false;
}

/**
 * The following methods are used to report ad network events to Buildbox.
 * Call these methods when appropriate (e.g. call interstitialLoaded when an interstitial is ready to be played).
 */
#pragma mark AdCallbacks

/**
 * Call this when you are done configuring the ad network (e.g. at the end of initSdkWithValues).
 */
- (void)sdkLoaded {
    _sdkLoadState = kLoadStateLoaded;
    [self.listener sdkLoaded:self.sdkId];
}

/**
 * Call this if you are unable to configure the ad network.
 * Buildbox will stop trying to run methods in the integrator after you call this.
 */
- (void)sdkFailed {
    _sdkLoadState = kLoadStateFailed;
    [self.listener sdkFailed:self.sdkId];
}

/**
 * Call this when the ad network reports that it is ready to display a banner ad.
 */
- (void)bannerLoaded {
    _bannerLoadState = kLoadStateLoaded;
    [self.listener bannerLoaded:self.sdkId];
}

/**
 * Call this if a banner ad failed to load or be displayed.
 */
- (void)bannerFailed {
    _bannerLoadState = kLoadStateFailed;
    [self.listener bannerFailed:self.sdkId];
}

/**
 * Call this when the ad network reports an impression for a banner ad.
 */
- (void)bannerImpression {
    [self.listener bannerImpression:[NSString stringWithFormat:@"%@ - %@", _sdkId, CustomAdNetworkName]];
}

/**
 * Call this when the ad network reports that it is ready to display an interstitial ad.
 */
- (void)interstitialLoaded {
    _interstitialLoadState = kLoadStateLoaded;
    [self.listener interstitialLoaded:self.sdkId];
}

/**
 * Call this if an interstitial ad failed to load or be displayed.
 */
- (void)interstitialFailed {
    _interstitialLoadState = kLoadStateFailed;
    [self.listener interstitialFailed:self.sdkId];
}

/**
 * Call this when the ad network reports an impression for an interstitial ad.
 */
- (void)interstitialImpression {
    [self.listener interstitialImpression:[NSString stringWithFormat:@"%@ - %@", _sdkId, CustomAdNetworkName]];
}

/**
 * Call this after the interstitial ad was closed.
 */
- (void)interstitialClosed {
    _interstitialLoadState = kLoadStateWaiting;
    [self.listener interstitialClosed:self.sdkId];
}

/**
 * Call this when the ad network reports that it is ready to display a rewarded video.
 */
- (void)rewardedVideoLoaded {
    _rewardedVideoLoadState = kLoadStateLoaded;
    [self.listener rewardedVideoLoaded:self.sdkId];
}

/**
 * Call this if a rewarded video failed to load.
 */
- (void)rewardedVideoFailed {
    _rewardedVideoLoadState = kLoadStateFailed;
    [self.listener rewardedVideoFailed:self.sdkId];
}

/**
 * Call this when the ad network reports an impression for a rewarded video.
 */
- (void)rewardedVideoImpression {
    [self.listener rewardedVideoImpression:[NSString stringWithFormat:@"%@ - %@", _sdkId, CustomAdNetworkName]];
}

/**
 * Call this if the ad network reported a reward was received (i.e. the user watched the entire rewarded video).
 */
- (void)rewardedVideoDidReward {
    [self.listener rewardedVideoDidReward:self.sdkId withValue:true];
}

/**
 * Call this after the rewarded video was closed.
 */
- (void)rewardedVideoDidEnd {
    _rewardedVideoLoadState = kLoadStateWaiting;
    [self.listener rewardedVideoDidEnd:self.sdkId withValue:true];
}

/** 
 * These methods are legacy calls for plugging your ad network into the game lifecycle.
 * If unsure, leave this be.
 */
#pragma mark LifecycleCallbacks

- (void)loadingDidComplete {
}

- (void)screenOnEnter:(NSString*)screenName {
}

- (void)screenOnExit:(NSString*)screenName {
}

- (void)sceneOnEnter:(NSString*)sceneName {
}

- (void)sceneOnExit:(NSString*)sceneName {
}

- (void)buttonActivated:(NSString*)buttonName {
}

- (bool)buttonVisible:(NSString*)buttonName; {
    return true;
}

@end
