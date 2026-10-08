# MicroMinds

## Firebase setup

- Enable **Email/Password** in Firebase Authentication to use sign-up, sign-in,
  password reset, and sign-out.
- The FlutterFire options and Android Firebase config are for the configured
  Firebase project. Reconfigure them with FlutterFire CLI when using another
  project. iOS also needs its matching `GoogleService-Info.plist` added to the
  Runner target in Xcode.
- FCM requests notification permission at runtime, registers for a messaging
  token, handles foreground and opened notifications, and registers a
  background message handler. Configure APNs credentials in Firebase for iOS
  push delivery. Retrieve a device token with
  `FirebaseMessagingService.instance.getToken()` when connecting a backend.

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
