
# Task1 Cubit

A Flutter project that demonstrates practical usage of Cubit/Bloc for state management, with supporting features such as local storage using Hive, HTTP requests via Dio, and responsive UI screens.

## Description

A sample application organized with clear routing and presentation/manager layers. It uses `flutter_bloc` (Cubit) for state management, `Hive` for local storage, and `dio` for networking. The project includes main features like: a custom bottom navigation bar, product list, shopping cart, favorites, and settings.

## Main Features

- State management using `flutter_bloc` (Cubits).
- Fast local storage with `hive` and `hive_flutter`.
- Network requests via `dio` with `pretty_dio_logger` for debugging.
- Custom bottom navigation bar (`persistent_bottom_nav_bar`), with a simple iOS Liquid style implementation.
- Responsive design support using `flutter_screenutil`.
- Device Preview support during development.

## Requirements

- Flutter SDK >= 3.9.2
- Compatible Dart SDK (see `pubspec.yaml`).

## Installation & Running

1. Clone the repository:

   `git clone git@github.com:MohmadAliAlali/flutter_cubit_store_app.git`

2. Navigate to the project folder:

   `cd "Flutter Project/2025 project/task1_cubit"`

3. Install dependencies:

   `flutter pub get`

4. If you use Hive with code generation, run:

   `flutter pub run build_runner build --delete-conflicting-outputs`

5. Run the app:

   `flutter run`

Note: `DevicePreview` is enabled by default in development mode (not in release).

## Project Structure (Summary)

- `lib/main.dart` — App entry point, Hive initialization, MultiBlocProvider setup.
- `lib/core/` — General settings: `route`, `storage`, `style`, `navigation`, etc.
- `lib/features/` — Functional modules by feature, each with `presentation` (screens/widgets/cubits) and possibly `data`/`domain`.
  - Example: `features/navbar/prisintation/view/wedgit/navbar_wid.dart` implements a custom iOS-style Liquid bottom navigation bar.
- `assets/` — Mock data and static files like `mock_data/users.json`.

## Main Packages (from `pubspec.yaml`)

- `flutter_bloc` — State management.
- `dio`, `pretty_dio_logger` — HTTP requests and logging.
- `hive`, `hive_flutter`, `hive_generator` — Local storage and code generation.
- `flutter_screenutil` — Responsive design support.
- `persistent_bottom_nav_bar` — Bottom navigation bar widgets.
- `device_preview` — Device preview during development.

## Development Tips

- Enable `DevicePreview` for easier multi-resolution UI development.
- Run `build_runner` after editing Hive models to update adapters.
- Use `BlocProvider` and `Cubit` for clear separation of UI and logic.

## Testing

To run unit tests (if available):

`flutter test`

## Mock Data

The project includes a mock data file: `assets/mock_data/users.json` for testing or simulation purposes.

## Contribution

Contributions are welcome! Open Issues or Pull Requests with a clear description of your changes and how to test them.

## License

Add your preferred license here (e.g., MIT). If not specified, assume the project is private.

---

Key Files:

- [pubspec.yaml](pubspec.yaml)
- [lib/main.dart](lib/main.dart)
- [lib/features/navbar/prisintation/view/wedgit/navbar_wid.dart](lib/features/navbar/prisintation/view/wedgit/navbar_wid.dart)

If you want, I can update the README to include more detailed usage examples for each Cubit or add a section explaining routes and Hive setup.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
