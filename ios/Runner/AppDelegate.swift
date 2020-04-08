import UIKit
import Flutter
import FBSDKLoginKit
import FBSDKCoreKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  //public type alias FBSDKApplicationDelegate = AppDelegate;

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
        FBSDKCoreKit.AppDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  @available(iOS 9.0, *)
  override  func application(_ application: UIApplication, 
    open url: URL, 
    options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      return AppDelegate.shared.application(application,  
        open: url, 
        sourceApplication:options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String, 
        annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }

  // iOS - 9.0
  override func application(_ application: UIApplication, 
    open url: URL, 
    sourceApplication: String?, 
    annotation: Any) -> Bool {
      return AppDelegate.shared.application(application,
        open: url,
        sourceApplication: sourceApplication,
        annotation: annotation)
  }
    
}
