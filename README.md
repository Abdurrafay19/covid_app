# covid_app

A cross-platform Flutter mobile application for tracking real-time global and country-specific COVID-19 metrics via REST API endpoints.

## Features

* **Global Statistics Dashboard**: Visualizes aggregate worldwide metrics—total cases, recoveries, active cases, and deaths—using pie chart data representation (`lib/world_statistics.dart`).
* **Country Search & Filtering**: Provides a searchable index of country records with dynamic query filtering (`lib/countries_list.dart`).
* **Shimmer Loading Indicators**: Renders skeleton loading states during asynchronous network calls (`lib/loading_countries_list.dart`).
* **Country Details Breakdown**: Displays localized metrics, including critical cases, today's case counts, tests performed, and mortality figures (`lib/details_screen.dart`).
* **Separated Service Layer**: Isolates API endpoint declarations (`lib/Services/app_url.dart`), HTTP network calls (`lib/Services/Utilities/stats_services.dart`), and data transfer models (`lib/Services/Models/world_stats_model.dart`).

## Architecture & Codebase Layout

```text
covid_app/
├── android/                         # Android native host project & Gradle configuration
│   └── app/build.gradle
├── assets/                          # Static assets and animation configurations
│   └── virus.json
├── ios/                             # iOS native host project & CocoaPods configuration
│   └── Runner.xcodeproj/
├── lib/
│   ├── main.dart                    # Application entry point and theme definitions
│   ├── splash_screen.dart           # Animated initial launch screen
│   ├── world_statistics.dart        # Global overview screen with chart visualization
│   ├── countries_list.dart          # Searchable list view of country metrics
│   ├── details_screen.dart          # Drill-down view for individual country statistics
│   ├── loading_countries_list.dart  # Shimmer skeleton loader component
│   └── Services/
│       ├── app_url.dart             # API base URLs and endpoint definitions
│       ├── Models/
│       │   └── world_stats_model.dart # Data serialization model for global metrics
│       └── Utilities/
│           └── stats_services.dart  # Network requests and data fetching service
├── analysis_options.yaml            # Dart static analysis configuration
└── pubspec.yaml                     # Dependencies, SDK constraints, and asset manifests

```

## Prerequisites

* **Flutter SDK**: `>=3.0.0`
* **Dart SDK**: `>=3.0.0 <4.0.0`
* **Android Development**: Android Studio, Android SDK (API Level 33+), JDK 11 or 17
* **iOS Development** (macOS host required): Xcode 14+, CocoaPods

Verify that the local environment meets all toolchain requirements:

```bash
flutter doctor

```

## Installation & Setup

1. Clone the repository:
```bash
git clone <REPOSITORY_URL>
cd covid_app

```


2. Fetch Flutter package dependencies:
```bash
flutter pub get

```


3. Verify connected target devices:
```bash
flutter devices

```



## Execution

Run the application on an active simulator, emulator, or physical device:

```bash
# Run on default connected device
flutter run

# Run on a specific target device
flutter run -d <DEVICE_ID>

# Run in release mode
flutter run --release

```

## External API Reference

The network layer in `lib/Services/` queries public REST endpoints configured in `lib/Services/app_url.dart`:

| Endpoint Role | Method | Path | Response Type | Description |
| --- | --- | --- | --- | --- |
| Global Overview | `GET` | `<BASE_URL>/all` | `JSON Object` | Retrieves cumulative global counts for cases, deaths, recovered, and active infections. |
| Countries List | `GET` | `<BASE_URL>/countries` | `JSON Array` | Retrieves per-country metrics, ISO codes, and flag image references. |

## Build & Packaging

Compile production-ready release binaries:

### Android

```bash
# Generate release APK
flutter build apk --release

# Generate Android App Bundle for Google Play
flutter build appbundle --release

```

Output binaries are placed in:

* `build/app/outputs/flutter-apk/app-release.apk`
* `build/app/outputs/bundle/release/app-release.aab`

### iOS (macOS host only)

```bash
flutter build ipa --release

```

Output archive is generated in:

* `build/ios/archive/Runner.xcarchive`

## Code Quality & Testing

Execute static analysis and the test suite:

```bash
# Run static analyzer
flutter analyze

# Execute unit and widget tests
flutter test

```

## License

This project is licensed under the terms specified in [LICENSE.md](LICENSE.md).
