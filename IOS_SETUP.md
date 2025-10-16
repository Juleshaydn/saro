# iOS 26 Liquid Glass Setup Instructions

## Important: Add Swift File to Xcode Project

The `LiquidGlassComponents.swift` file needs to be added to the Xcode project. Follow these steps:

### Step 1: Open Xcode
The workspace should already be open. If not, run:
```bash
open ios/Runner.xcworkspace
```

### Step 2: Add the Swift File
1. In Xcode, right-click on the **Runner** folder in the left sidebar
2. Select **"Add Files to "Runner"...**
3. Navigate to `/ios/Runner/LiquidGlassComponents.swift`
4. Make sure **"Copy items if needed"** is UNCHECKED (the file is already in the right place)
5. Make sure **"Add to targets: Runner"** is CHECKED
6. Click **"Add"**

### Step 3: Verify the File
- The file should now appear in the Runner folder in Xcode
- It should have a checkmark in the **Target Membership** section (Runner target)

### Step 4: Build the App
Close Xcode and run:
```bash
flutter run
```

## What's Implemented

### Native iOS 26 Liquid Glass Components

1. **LiquidGlassLoginView**
   - Full login screen with iOS 26 `.glassEffect()` and `.buttonStyle(.glass)`
   - Sign in with Apple button
   - Sign in with Google button  
   - Skip button with gradient background
   - All using native SwiftUI iOS 26 APIs

2. **LiquidGlassGenerateVideoCard**
   - Video prompt input with liquid glass card effect
   - Generate button with native glass styling
   - Embedded in the Generate Video screen

### How It Works

- **Flutter Side**: Uses `UiKitView` to embed native SwiftUI views
- **SwiftUI Side**: Creates views with iOS 26 `glassEffect()` and `GlassEffectContainer`
- **Communication**: MethodChannel for button callbacks (e.g., Skip button navigation)

### File Structure
```
ios/Runner/
├── AppDelegate.swift (registers PlatformViews)
├── LiquidGlassComponents.swift (SwiftUI views with Liquid Glass)
└── Runner-Bridging-Header.h
```

### iOS 26 APIs Used
- `.glassEffect()` - Native liquid glass blur effect
- `.glassEffect(in: .rect(cornerRadius:))` - Glass effect with custom shape
- `.buttonStyle(.glass)` - Native glass button style
- `GlassEffectContainer` - Container for glass styled content

### Fallback
For devices running iOS < 26, the app provides fallback UI using:
- `.ultraThinMaterial` backgrounds
- Standard blur effects
- Traditional button styles

## Requirements
- iOS 26.0 or later for Liquid Glass effects
- Xcode 16.0 or later
- Swift 5.9 or later

## Troubleshooting

### Build Error: "Cannot find 'LiquidGlassLoginViewFactory'"
**Solution**: The Swift file hasn't been added to the Xcode project. Follow Step 2 above.

### App Crashes on Launch
**Check**: Make sure you're running on iOS 26.0 or later, or the fallback code is working properly.

### Liquid Glass Effect Not Visible
**Verify**: 
1. You're running on a physical device with iOS 26.1
2. The device supports the liquid glass effects (iPhone 12 and later)
3. Background has appropriate content for the blur effect to be visible

## Testing
Run on your iPhone 16 Pro with iOS 26.1 Public Beta:
```bash
flutter run
```

The login screen will show native iOS 26 Liquid Glass effects! 🎉

