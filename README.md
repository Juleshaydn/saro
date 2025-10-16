# Saro - AI Video Generation App

A modern Flutter application for creating AI-generated videos with support for iOS and Android.

## Features

### Login Screen
- **Sign in with Apple** button (iOS) - Static placeholder for future implementation
- **Sign in with Google** button - Static placeholder for future implementation
- **Skip** button - Navigates directly to the main app

### Main App Pages
1. **Generate Video** (Create tab)
   - Video prompt input field
   - Configuration options (Duration, Aspect Ratio, Style)
   - Generate button placeholder

2. **My Videos**
   - Video library view
   - Empty state for new users

3. **Profile**
   - User profile information
   - Statistics display (Videos, Created, Shared)
   - Settings options (Account, Notifications, Privacy, About)

## Design Language

### iOS (iOS 26.1 Public Beta)
- **Native iOS 26 Liquid Glass Design** using SwiftUI and PlatformView:
  - Native SwiftUI components with `.glassEffect()` API (iOS 26+)
  - `GlassEffectContainer` for glass-styled content
  - `.buttonStyle(.glass)` for authentic iOS 26 button styling
  - Native liquid glass blur and translucent surfaces
  - Embedded via Flutter's `UiKitView` for seamless integration
  - MethodChannel communication for callbacks
  - CupertinoNavigationBar with translucent background
  - Full iOS 26 design language compliance

### Android
- **Material 3 Design** with:
  - Material You color schemes
  - Modern navigation patterns
  - Elevation and shadow effects
  - Material icons

## Getting Started

### Prerequisites
- Flutter SDK 3.35.6 or later
- Xcode 16.0 or later (for iOS development)
- Android Studio (for Android development)
- iOS 26.0 or later (for native Liquid Glass effects)
- Android SDK 21 or later

### Installation

1. Install dependencies:
```bash
flutter pub get
```

2. **IMPORTANT: iOS Setup Required**
   
   The native iOS 26 Liquid Glass SwiftUI components need to be added to Xcode.
   See **[IOS_SETUP.md](IOS_SETUP.md)** for detailed instructions.
   
   Quick steps:
   - Open `ios/Runner.xcworkspace` in Xcode
   - Add `ios/Runner/LiquidGlassComponents.swift` to the Runner target
   - Build and run

3. Run the app:

For iOS with Native Liquid Glass:
```bash
flutter run
```

For Android:
```bash
flutter run -d android
```

### iOS 26 Native Liquid Glass Setup
**⚠️ Required Step**: Before running on iOS, you must add the SwiftUI file to Xcode.

See **[IOS_SETUP.md](IOS_SETUP.md)** for complete instructions.

### Building for Release

iOS:
```bash
flutter build ios --release
```

Android:
```bash
flutter build apk --release
```

## Project Structure

```
lib/
├── main.dart                           # App entry point
└── screens/
    ├── login_screen.dart               # Login/welcome screen
    ├── home_screen.dart                # Main screen with bottom navigation
    ├── generate_video_screen.dart      # Video creation page
    ├── my_videos_screen.dart          # Video library page
    └── profile_screen.dart            # User profile page
```

## Dependencies

### Flutter Packages
- `flutter`: Flutter SDK
- `cupertino_icons`: iOS style icons
- `flutter_platform_widgets`: Platform-specific widgets
- `google_fonts`: Custom font support

### Native iOS Components
- `LiquidGlassComponents.swift`: Custom SwiftUI views with iOS 26 Liquid Glass effects
- Uses native iOS 26 APIs: `.glassEffect()`, `.buttonStyle(.glass)`, `GlassEffectContainer`
- Integrated via Flutter's `UiKitView` and PlatformView

## Future Implementation

The following features are placeholders and ready for implementation:

1. **Authentication**
   - Google Sign-In integration
   - Apple Sign-In integration
   - User session management

2. **Video Generation**
   - AI video generation API integration
   - Video configuration options
   - Processing status tracking

3. **Video Library**
   - Video storage and retrieval
   - Video playback
   - Share functionality

4. **Profile**
   - User account management
   - Settings persistence
   - Statistics tracking

## Development Notes

- All sign-in buttons are currently static (no functionality)
- Bottom navigation is fully functional
- All pages have template UI ready for feature implementation
- Design follows platform-specific guidelines (Liquid Glass for iOS, Material 3 for Android)

## License

Private project - All rights reserved

## Contact

For questions or issues, please contact the development team.
