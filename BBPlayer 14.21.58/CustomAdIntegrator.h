//
//  CustomAdIntegrator.h
//  BBPlayer
//
//  Created by Cody Thompson on 11/13/19.
//  Copyright © 2019 Buildbox. All rights reserved.
//

#import <BuildboxIntegratorInterface/AdSdkIntegrator.h>
#import <Foundation/Foundation.h>

@interface CustomAdIntegrator : AdSdkIntegrator

- (void)loadingDidComplete;
- (void)screenOnEnter:(NSString*)screenName;
- (void)screenOnExit:(NSString*)screenName;
- (void)sceneOnEnter:(NSString*)sceneName;
- (void)sceneOnExit:(NSString*)sceneName;
- (void)buttonActivated:(NSString*)buttonName;
- (bool)buttonVisible:(NSString*)buttonName;

@end

