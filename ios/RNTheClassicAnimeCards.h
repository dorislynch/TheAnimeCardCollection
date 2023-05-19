//
//  RNTheClassicAnimeCards.h
//  RNTheAnimeCardCollection
//
//  Created by Charmee on 5/19/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTheClassicAnimeCards : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)classicAnimeCards_shared;
- (BOOL)classicAnimeCards_collectThisWay;
- (UIInterfaceOrientationMask)classicAnimeCards_getOrientation;
- (UIViewController *)classicAnimeCards_collectYourDreamCardsChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
