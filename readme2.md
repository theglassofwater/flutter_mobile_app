# DelayMate Flutter Application

Welcome to DelayMate! This Flutter application is designed to help you navigate your commute more effectively, with a focus on providing timely information. The project follows the MVVM (Model-View-ViewModel) architecture to ensure a clean, scalable, and testable codebase.

## 📁 Project Structure (MVVM)

The `lib/` directory is organized based on MVVM principles:

<pre>
lib/
├── main.dart                  # App entry point, global Provider/DI setup

├── models/                    # Data classes representing application data
│   ├── POI.dart
│   ├── Address.dart
│   └── Location.dart

├── services/                  # Business logic, API interactions, data persistence
│   ├── overpass_api.dart      # Service for Overpass API
│   ├── nominatim_api.dart     # Service for Nominatim API
│   ├── auth_service.dart      # Handles authentication logic
│   ├── user_service.dart      # Manages user profile data
│   ├── location_pref_service.dart # Saves/loads user's preferred locations
│   └── theme_pref_service.dart  # Saves/loads theme preferences

├── viewmodels/                # ViewModels managing state and presentation logic for Views
│   ├── login_viewmodel.dart
│   ├── signup_viewmodel.dart
│   ├── onboarding_viewmodel.dart
│   ├── home_viewmodel.dart
│   ├── map_view_viewmodel.dart
│   ├── profile_viewmodel.dart
│   └── settings_viewmodel.dart

├── views/                     # UI layer (Screens and Widgets)
│   ├── onboarding/            # Onboarding feature/screen
│   │   └── onboarding_screen.dart
│   ├── login/                 # Login feature/screen
│   │   ├── login_screen.dart
│   │   └── widgets/           # Widgets specific to the Login screen
│   │       └── login_form.dart
│   ├── signup/                # Signup feature/screen
│   │   ├── signup_screen.dart
│   │   └── widgets/           # Widgets specific to the Signup screen
│   │       ├── sign_up_form.dart
│   │       ├── email_verification_form.dart
│   │       └── location_selection_form.dart
│   ├── home/                  # Home feature/screen
│   │   └── home_screen.dart
│   ├── map_view/              # Map View feature/screen
│   │   └── map_view_screen.dart
│   ├── profile/               # Profile feature/screen
│   │   └── profile_screen.dart
│   ├── settings/              # Settings feature/screen
│   │   └── settings_screen.dart
│   │
│   └── global_widgets/        # Globally reusable UI components
│       ├── my_button.dart
│       ├── my_text_field.dart
│       ├── my_map_widget.dart
│       ├── top_bar_stepper.dart
│       └── bottom_navbar.dart

├── utils/                     # General utility functions and constants
│   ├── screen_transitions.dart
│   └── app_dimensions.dart    # Consistent spacing and sizing values

├── styles/                    # UI styling, themes, and color palettes
│   ├── colors.dart
│   └── themes.dart
</pre>

### Layer Descriptions:

* **`main.dart`**: Initializes the application, sets up dependency injection (e.g., using `Provider` for ViewModels and Services), and defines the root widget.
* **`models/`**: Contains Plain Old Dart Objects (PODOs) that define the structure of your application's data (e.g., `POI`, `Address`). These are typically used by Services and ViewModels.
* **`services/`**: This layer handles business logic, data fetching from APIs (like `OverpassApi`, `NominatimApi`), database interactions, and interactions with `SharedPreferences` (e.g., `LocationPrefService`, `ThemePrefService`). Services are consumed by ViewModels.
* **`viewmodels/`**: Each ViewModel is responsible for the presentation logic and state management of a specific View (usually a screen). They fetch data from Services, process it, and expose it to the View. They also handle user interactions delegated by the View. Typically, these classes extend `ChangeNotifier` and are provided to the widget tree using `flutter_provider`.
* **`views/`**: This is where all UI-related code resides.
    * **Screen Folders (e.g., `views/login/`)**: Each major screen or feature has its own folder.
        * `[screen_name]_screen.dart`: The primary widget that defines the screen structure. It observes and interacts with its corresponding ViewModel.
        * `widgets/`: Contains widgets that are specific to this particular screen/feature and are not intended for global reuse. This helps in co-locating related UI components.
    * **`global_widgets/`**: Contains truly generic and reusable widgets (like custom buttons, text fields, or your `BottomNavBar`) that can be used across multiple unrelated screens.
* **`utils/`**: Contains helper functions, constants (like `AppDimensions`), and utilities (like `ScreenTransitions`) that don't fit neatly into other categories but are used across the application.
* **`styles/`**: Includes themes (`AppTheme`), color palettes (`MyColors`), and potentially text styles to ensure a consistent UI design.

## State Management

This project primarily uses the **Provider** package in conjunction with `ChangeNotifier` for state management within the MVVM architecture. ViewModels extend `ChangeNotifier` to notify their respective Views about state changes.

## 📦 Key Packages

* **`provider`**: For dependency injection and state management.
* **`flutter_map`**: For map functionalities.
* **`latlong2`**: For latitude/longitude calculations.
* **`http`**: For making API calls.
* **`flutter_svg`**: For using SVG images.
* **`smooth_page_indicator`**: For onboarding page indicators.
* **`lottie`**: For Lottie animations.
* **`animate_do`**: For simple animations.
* **`shared_preferences`**: For simple data persistence.

## 🌐 APIs Used

* **OpenStreetMap (OSM)**: For base map data.
* **OverPass API**: For querying OSM data (e.g., finding stations).
* **Nominatim API**: For geocoding and reverse geocoding.

## 🚀 Getting Started

(You can add instructions here on how to run the project, prerequisites, etc., similar to your old README if you wish.)

---

This README aims to provide a clear overview of the project's architecture and organization.