import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Register Liquid Glass PlatformViews
    guard let controller = window?.rootViewController as? FlutterViewController else {
      fatalError("rootViewController is not type FlutterViewController")
    }
    
    let registrar = self.registrar(forPlugin: "LiquidGlassPlatformViews")!
    
    // Register Login View
    let loginFactory = LiquidGlassLoginViewFactory(messenger: registrar.messenger())
    registrar.register(loginFactory, withId: "LiquidGlassLoginView")
    
    // Register Generate Video Card
    let generateCardFactory = LiquidGlassGenerateCardFactory(messenger: registrar.messenger())
    registrar.register(generateCardFactory, withId: "LiquidGlassGenerateCard")
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
