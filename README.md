<div align="center">
  <h1>Covid-19 Tracker App</h1>

  <p><strong>A real-time, cross-platform mobile application providing global and country-specific health statistics.</strong></p>

  <p>
    <img alt="Flutter" src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white" />
    <img alt="Dart" src="https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white" />
    <img alt="REST API" src="https://img.shields.io/badge/REST-API_Integration-FF4500?style=flat&logo=json&logoColor=white" />
    <img alt="License" src="https://img.shields.io/badge/License-MIT-green.svg" />
  </p>
</div>

---

## 📖 Table of Contents
- [About the Project](#-about-the-project)
- [Key Features](#-key-features)
- [Tech Stack](#-tech-stack)
- [Project Architecture](#-project-architecture)
- [Getting Started](#-getting-started)
- [License](#-license)

---

## 🚀 About the Project

The **Covid-19 Tracker App** is a personal project built to demonstrate proficiency in connecting frontend mobile interfaces with live, external RESTful APIs. 

Designed with a clean, responsive UI, the application fetches real-time data regarding the global pandemic. It handles complex JSON serialization, asynchronous network requests, and smooth state transitions to provide users with an uninterrupted, informative experience. The app also features custom Lottie animations (such as the virus graphic) to elevate the visual polish.

### 🎯 Key Features
* **Global Dashboard:** A high-level overview of worldwide statistics dynamically updated on launch.
* **Granular Country Data:** A dedicated screen allowing users to view specific metrics for individual nations.
* **Live Search & Filtering:** An optimized search mechanism within the `countries_list` that instantly filters results from the fetched API data without requiring additional network calls.
* **Graceful Asynchronous UI:** Utilizes shimmer effects and loading screens (`loading_countries_list.dart`) to ensure the user is always informed of the network state while data is being fetched.
* **Custom Animations:** Integrates JSON-based animations (`assets/virus.json`) for a modern, engaging splash screen and loading states.

---

## 🛠 Tech Stack

* **Framework:** Flutter (Cross-platform for Android & iOS)
* **Language:** Dart
* **Networking:** Standard HTTP package for REST API communication
* **Data Parsing:** JSON serialization to custom Dart Models (`world_stats_model.dart`)
* **Animations:** Lottie for Flutter

---

## 🏗 Project Architecture

To ensure the codebase remains maintainable and scalable, the application strictly separates business logic and networking from the user interface. 

```text
lib/
├── Services/
│   ├── Models/               # JSON data structures (world_stats_model.dart)
│   ├── Utilities/            # API fetching logic (stats_services.dart)
│   └── app_url.dart          # Centralized endpoint management
├── splash_screen.dart        # Entry point with Lottie animations
├── world_statistics.dart     # Global data dashboard
├── countries_list.dart       # Searchable list of all countries
├── details_screen.dart       # Deep-dive metrics for a specific selection
└── main.dart                 # App initialization and routing

```

---

## ⚙️ Getting Started

Follow these steps to run the application locally.

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install)
* Android Studio / Xcode (for mobile emulation) or a connected physical device.

### Installation

**1. Clone the repository:**

```bash
git clone https://github.com/abdurrafay19/covid_app.git
cd covid_app

```

**2. Fetch Flutter dependencies:**

```bash
flutter pub get

```

**3. Run the application:**
Ensure you have a device connected or an emulator running, then execute:

```bash
flutter run

```

---

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.