# Flutter Android App

This Flutter Android application follows a clean and scalable folder structure inspired by [A Simple Way to Organize Your Code in Flutter](https://medium.com/@kanellopoulos.leo/a-simple-way-to-organize-your-code-in-flutter-e175e7004fb5).

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

### models/
- Contains data model classes representing the structure of data used in the app.

### screens/
- Each screen has its own subdirectory:
  - `*_screen.dart`: UI components.
  - `*_controller.dart`: Logic and state handling.
- UI and controller files can use `part` and `part of` directives for tight coupling.

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

## 🚀 Getting Started



