import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../firebase_options.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class FirebaseMessagingService {
  FirebaseMessagingService._();

  static final FirebaseMessagingService instance = FirebaseMessagingService._();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  bool _initialized = false;

  static void registerBackgroundHandler() {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  Future<void> initialize() async {
    if (_initialized || kIsWeb) return;

    try {
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        debugPrint('Notification permission was denied.');
      }

      await _messaging.getToken();
      _messaging.onTokenRefresh.listen(
        (_) => debugPrint('FCM registration token refreshed.'),
        onError: (Object error) {
          debugPrint('FCM token refresh failed: $error');
        },
      );
      FirebaseMessaging.onMessage.listen(_showForegroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_showOpenedMessage);

      final initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) {
        _showOpenedMessage(initialMessage);
      }

      _initialized = true;
    } on FirebaseException catch (error) {
      debugPrint('Firebase Messaging initialization failed: ${error.message}');
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text('Notifications unavailable: ${error.message}')),
      );
    } on PlatformException catch (error) {
      debugPrint('Firebase Messaging initialization failed: ${error.message}');
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text('Notifications unavailable: ${error.message}')),
      );
    }
  }

  Future<String?> getToken() => _messaging.getToken();

  void _showForegroundMessage(RemoteMessage message) {
    final notification = message.notification;
    final text = notification?.body ?? notification?.title;
    if (text == null || text.isEmpty) return;

    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  void _showOpenedMessage(RemoteMessage message) {
    final title = message.notification?.title;
    if (title == null || title.isEmpty) return;

    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(title)),
    );
  }
}
