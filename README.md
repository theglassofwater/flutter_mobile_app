# Flutter Android App

This Flutter Android application follows a clean and scalable folder structure inspired by [A Simple Way to Organize Your Code in Flutter](https://medium.com/@kanellopoulos.leo/a-simple-way-to-organize-your-code-in-flutter-e175e7004fb5). 

Maybe use [How to structure styles and themes](https://medium.com/@kanellopoulos.leo/a-simple-way-to-organize-your-styles-themes-in-flutter-a0e7eba5b297) when i start using styles and themes.

## 📁 Project Structure
<pre>
lib/ 
├── models/ 
├── screens/ 
│ ├── home/ 
│ │ ├── home_screen.dart 
│ │ └── home_controller.dart 
│ └── ... 
├── services/ 
├── styles/ 
├── utils/ 
├── widgets/
├── commons.dart 
└── main.dart
</pre>

### big_widgets/
- Large Reusable UI components that can be shared between screens.

### models/
- Contains data model classes representing the structure of data used in the app.

### screens/
- Each screen has its own subdirectory:
  - `*_screen.dart`: UI components.
  - `*_controller.dart`: Logic and state handling.
- UI and controller files can use `part` and `part of` directives for tight coupling.
- (NOT IMPLEMENTED LIKE THIS YET.)

### services/
- Contains logic for communicating with APIs, databases, or other external services.

### styles/
- Includes themes, color palettes, and text styles for consistent UI design.

### utils/
- Utility functions and helpers used across the app.

### widgets/
- Reusable UI components that can be shared between screens.

### commons.dart
- Centralized file for common imports and constants used throughout the app.


## Packages

- provider
- flutter_map
- latlong2
- http
- flutter_svg
- smooth_page_indicator
- lottie
- animate_do

## API's

- OpenStreetMap (OSM)
- OverPass API
- Nominatim API

## 🚀 Getting Started



