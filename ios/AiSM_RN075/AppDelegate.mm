#import "AppDelegate.h"
#import "AppsealingiOS.h"

#import <React/RCTBundleURLProvider.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"AiSM_RN075";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};


  //############################################################## AppSealing Code-Part BEGIN: DO NOT MODIFY THIS LINE !!!
  #if true  //--------------------------------------- APPSEALING-GetDeviceID [BEGIN] : DO NOT REMOVE THIS COMMENT !!!
  NSString* _appsealing_msg1 = @"\n\n* AppSealing Device ID : ";
  char _appSealingDeviceID_auto_generated[64];
  
  // query AppSealing device unique identifier (optional)
  if ( ObjC_GetAppSealingDeviceID( _appSealingDeviceID_auto_generated ) == 0 )
      _appsealing_msg1 = [_appsealing_msg1 stringByAppendingString:[[NSString alloc] initWithUTF8String:_appSealingDeviceID_auto_generated]];
  else
      _appsealing_msg1 = [_appsealing_msg1 stringByAppendingString:@"Unknown"];
  NSLog( [_appsealing_msg1 stringByAppendingString:@"%s"], "\n" );
  #endif    //--------------------------------------- APPSEALING-GetDeviceID [END] : DO NOT REMOVE THIS COMMENT !!!

  #if true  //--------------------------------------- APPSEALING-GetCredential [BEGIN] : DO NOT REMOVE THIS COMMENT !!!
  NSString* _appsealing_msg3 = @"\n\n* AppSealing Credential : ";
  char _appSealingCredential_auto_generated[290];
  if ( ObjC_GetEncryptedCredential( _appSealingCredential_auto_generated ) == 0 )
      _appsealing_msg3 = [_appsealing_msg3 stringByAppendingString:[[NSString alloc] initWithUTF8String:_appSealingCredential_auto_generated]];
  else
      _appsealing_msg3 = [_appsealing_msg3 stringByAppendingString:@"Unknown"];
  NSLog( [_appsealing_msg3 stringByAppendingString:@"%s"], "\n" );
  // use thie credential value in your authentication function
  #endif    //--------------------------------------- APPSEALING-GetCredential [END] : DO NOT REMOVE THIS COMMENT !!!

  #if false //--------------------------------------- APPSEALING-AntiSwizzling [BEGIN] : DO NOT REMOVE THIS COMMENT !!!
  [AppSealingInterface _NotifySwizzlingDetected:^( NSString* msg ) {
      UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"AppSealing"
                                  message:msg
                                  preferredStyle:UIAlertControllerStyleAlert];
      UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"Confirm"
                                  style:UIAlertActionStyleDefault
                                  handler:^( UIAlertAction * _Nonnull action ) {
                              #if !DEBUG && !defined(DEBUG) // Debug mode does not kill app even if security threat has found
                                      exit( 0 );
                              #endif
                                  }];
      [alert addAction:confirm];
      [self presentViewController:alert animated:YES completion:nil];
  }];
  #endif    //--------------------------------------- APPSEALING-AntiSwizzling [END] : DO NOT REMOVE THIS COMMENT !!!
  //############################################################## AppSealing Code-Part END: DO NOT MODIFY THIS LINE !!!



  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
