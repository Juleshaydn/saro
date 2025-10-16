import Foundation
import Flutter
import SwiftUI

// MARK: - Liquid Glass Button View
struct LiquidGlassButtonView: View {
    let text: String
    let icon: String?
    let isPrimary: Bool
    let onTap: () -> Void
    
    var body: some View {
        if #available(iOS 26.0, *) {
            Button(action: onTap) {
                HStack(spacing: 12) {
                    if let icon = icon {
                        Image(systemName: icon)
                            .font(.system(size: 20))
                    }
                    Text(text)
                        .font(.system(size: 17, weight: .semibold))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
            }
            .buttonStyle(.glass)
            .glassEffect()
        } else if #available(iOS 15.0, *) {
            // Fallback for iOS 15-25
            Button(action: onTap) {
                HStack(spacing: 12) {
                    if let icon = icon {
                        Image(systemName: icon)
                            .font(.system(size: 20))
                    }
                    Text(text)
                        .font(.system(size: 17, weight: .semibold))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(.ultraThinMaterial)
                .cornerRadius(16)
            }
        } else {
            // Fallback for iOS < 15
            Button(action: onTap) {
                HStack(spacing: 12) {
                    if let icon = icon {
                        Image(systemName: icon)
                            .font(.system(size: 20))
                    }
                    Text(text)
                        .font(.system(size: 17, weight: .semibold))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(Color.white.opacity(0.7))
                .cornerRadius(16)
            }
        }
    }
}

// MARK: - Liquid Glass Card View
struct LiquidGlassCardView: View {
    let content: AnyView
    
    var body: some View {
        if #available(iOS 26.0, *) {
            content
                .glassEffect(in: .rect(cornerRadius: 20))
        } else if #available(iOS 15.0, *) {
            // Fallback for iOS 15-25
            content
                .background(.ultraThinMaterial)
                .cornerRadius(20)
        } else {
            // Fallback for iOS < 15
            content
                .background(Color.white.opacity(0.7))
                .cornerRadius(20)
        }
    }
}

// MARK: - Login Screen Container
struct LiquidGlassLoginView: View {
    @State private var buttonPressed: String = ""
    var onSkip: (() -> Void)?
    
    var body: some View {
        if #available(iOS 26.0, *) {
            GlassEffectContainer {
                VStack(spacing: 20) {
                    // App Logo
                    Image(systemName: "video.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .padding(30)
                        .glassEffect(in: .rect(cornerRadius: 30))
                    
                    VStack(spacing: 8) {
                        Text("Welcome to Saro")
                            .font(.system(size: 32, weight: .bold))
                        Text("Create amazing videos with AI")
                            .font(.system(size: 16))
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 20)
                    
                    // Sign in with Apple
                    Button(action: {
                        buttonPressed = "apple"
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "applelogo")
                                .font(.system(size: 20))
                            Text("Sign in with Apple")
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                    }
                    .buttonStyle(.glass)
                    .glassEffect()
                    
                    // Sign in with Google
                    Button(action: {
                        buttonPressed = "google"
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "g.circle.fill")
                                .font(.system(size: 20))
                            Text("Sign in with Google")
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                    }
                    .buttonStyle(.glass)
                    .glassEffect()
                    
                    // Divider
                    HStack {
                        Rectangle()
                            .fill(.secondary.opacity(0.3))
                            .frame(height: 1)
                        Text("or")
                            .foregroundStyle(.secondary)
                            .padding(.horizontal, 16)
                        Rectangle()
                            .fill(.secondary.opacity(0.3))
                            .frame(height: 1)
                    }
                    .padding(.vertical, 8)
                    
                    // Skip Button
                    Button(action: {
                        onSkip?()
                    }) {
                        HStack(spacing: 8) {
                            Text("Skip")
                                .font(.system(size: 17, weight: .semibold))
                            Image(systemName: "arrow.forward")
                                .font(.system(size: 16))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .foregroundStyle(.white)
                        .background(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(16)
                    }
                    .glassEffect()
                }
                .padding(32)
            }
        } else if #available(iOS 15.0, *) {
            // Fallback UI for iOS 15-25
            VStack(spacing: 20) {
                Text("iOS 26 required for full Liquid Glass experience")
                    .font(.headline)
                Text("Running in compatibility mode")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
        } else {
            // Fallback UI for iOS < 15
            VStack(spacing: 20) {
                Text("iOS 26 required for Liquid Glass")
                    .font(.headline)
            }
            .padding()
            .background(Color.white.opacity(0.7))
            .cornerRadius(16)
        }
    }
}

// MARK: - Generate Video Card
struct LiquidGlassGenerateVideoCard: View {
    @State private var prompt: String = ""
    
    var body: some View {
        if #available(iOS 26.0, *) {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Image(systemName: "wand.and.stars")
                        .foregroundStyle(.blue)
                    Text("Video Prompt")
                        .font(.system(size: 15, weight: .semibold))
                }
                
                TextEditor(text: $prompt)
                    .frame(height: 120)
                    .scrollContentBackground(.hidden)
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                
                Button(action: {
                    // Generate action
                }) {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("Generate Video")
                            .font(.system(size: 18, weight: .semibold))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .foregroundStyle(.white)
                    .background(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(16)
                }
                .buttonStyle(.glass)
            }
            .padding(20)
            .glassEffect(in: .rect(cornerRadius: 20))
        } else if #available(iOS 15.0, *) {
            VStack(spacing: 12) {
                Text("iOS 26 required for full experience")
                    .font(.headline)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
        } else {
            Text("iOS 26 required")
                .padding()
        }
    }
}

// MARK: - Platform View Factory for Login
class LiquidGlassLoginViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return LiquidGlassLoginPlatformView(frame: frame, viewId: viewId, messenger: messenger, args: args)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

class LiquidGlassLoginPlatformView: NSObject, FlutterPlatformView {
    private var hostingController: UIHostingController<LiquidGlassLoginView>
    private var methodChannel: FlutterMethodChannel
    
    init(frame: CGRect, viewId: Int64, messenger: FlutterBinaryMessenger, args: Any?) {
        // 1. Initialize properties first
        methodChannel = FlutterMethodChannel(name: "com.saro.saro/navigation", binaryMessenger: messenger)
        hostingController = UIHostingController(rootView: LiquidGlassLoginView())
        
        // 2. Call super.init() BEFORE using 'self'
        super.init()
        
        // 3. Now we can use 'self' safely
        var swiftUIView = LiquidGlassLoginView()
        swiftUIView.onSkip = { [weak self] in
            self?.methodChannel.invokeMethod("skipLogin", arguments: nil)
        }
        
        // Update the view
        hostingController.rootView = swiftUIView
        hostingController.view.backgroundColor = .clear
        hostingController.view.frame = frame
    }
    
    func view() -> UIView {
        return hostingController.view
    }
}

// MARK: - Platform View Factory for Generate Video Card
class LiquidGlassGenerateCardFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return LiquidGlassGenerateCardPlatformView(frame: frame, viewId: viewId, messenger: messenger, args: args)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

class LiquidGlassGenerateCardPlatformView: NSObject, FlutterPlatformView {
    private var hostingController: UIHostingController<LiquidGlassGenerateVideoCard>
    
    init(frame: CGRect, viewId: Int64, messenger: FlutterBinaryMessenger, args: Any?) {
        let swiftUIView = LiquidGlassGenerateVideoCard()
        hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.view.backgroundColor = .clear
        hostingController.view.frame = frame
        super.init()
    }
    
    func view() -> UIView {
        return hostingController.view
    }
}

// MARK: - Glass Effect Container (iOS 26+)
@available(iOS 26.0, *)
struct GlassEffectContainer<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .buttonStyle(.glass)
    }
}

