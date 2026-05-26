# Jobspot Flutter App

A Flutter mobile application featuring a modern UI design and Firebase authentication.

## Features

- Firebase Authentication (Email/Password and Google Sign-In).
  - Note: Google Sign-In is currently not working on the Web platform.
- State Management using BLoC pattern.
- Clean Architecture principles (Core, Features, Data, Domain, Presentation).
- Native Compile-Time Environment Configurations.

## Prerequisites

- Flutter SDK (3.11.1 or higher).
- Android Studio or Visual Studio Code.
- A valid Firebase project configuration.

## Getting Started

1. Navigate to the lab1 directory:
   cd lab1

2. Set up environment variables by copying the template and filling in your Firebase credentials:
   cp config.json.example config.json

3. Install the required Flutter dependencies:
   flutter pub get

4. Run the application using the configuration file:
   flutter run --dart-define-from-file=config.json
