//
//  AOBAnalyticsReporting.h
//  AOBAnalyticsReporting
//
//  Created by armen on 7/18/19.
//  Copyright © 2019 apponboard. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef __cplusplus
extern "C" {
#endif
    void AOBInitializeReporting(NSString *buildboxVersion);
    void AOBSetBuildboxWorldMode(void);
    void AOBStartSessionReporting(void);
    void AOBStopSessionReporting(void);

    void AOBSendAdAttemptReport(NSString *networkName, NSString *adType, bool filled);
    void AOBSendBannerAdAttemptReport(NSString *networkName, bool filled);
    void AOBSendInterstitialAdAttemptReport(NSString *networkName, bool filled);
    void AOBSendRewardedAdAttemptReport(NSString *networkName, bool filled);

    void AOBSendAdZoneAttemptReport(NSString *networkName, NSString *adType, NSString *zoneId, bool filled);
    void AOBSendBannerAdZoneAttemptReport(NSString *networkName, NSString *zoneId, bool filled);
    void AOBSendInterstitialAdZoneAttemptReport(NSString *networkName, NSString *zoneId, bool filled);
    void AOBSendRewardedAdZoneAttemptReport(NSString *networkName, NSString *zoneId, bool filled);

    void AOBClearCache(void);
    NSString *AOBGetSessionDescription(void);

    void AOBAnalyticsReportingSetLogLevelToError(void);
    void AOBAnalyticsReportingSetLogLevelToWarn(void);
    void AOBAnalyticsReportingSetLogLevelToInfo(void);
    void AOBAnalyticsReportingSetLogLevelToDebug(void);
    void AOBAnalyticsReportingSetLogLevelToVerbose(void);
    void AOBAnalyticsReportingSetLogLevelToSuperVerbose(void);

    void AOBStartBitSessionReporting(NSString *bitId, NSString *bitName);
    void AOBStopBitSessionReporting(void);

    void AOBSetDev(void);

    NSString *AOBSessionId(void);
    NSString *AOBBitSessionId(void);
    
#ifdef __cplusplus
}
#endif

