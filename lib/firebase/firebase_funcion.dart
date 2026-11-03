import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ticketsystem/global/global.dart';

class FirebaseService {
  static FirebaseService shared = FirebaseService();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();


  /// Initialize Firebase Messaging
  Future<void> initializeFirebase(BuildContext context) async {
  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    criticalAlert: true,
    carPlay: true,
    announcement: true,
  );

  debugPrint("Notification permission status: ${settings.authorizationStatus}");
  if (settings.authorizationStatus == AuthorizationStatus.denied) {
    debugPrint("User denied permission for notifications.");
    return;
  }
    // Update the server with the token here
    updateTokenOnServer(devicetoken, context);

    // Listen for token refreshes
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      debugPrint("Firebase Token Refreshed: $newToken");

      // Update the server with the new token here
      updateTokenOnServer(newToken,context);
    });
    // Get the device token
    devicetoken = await _firebaseMessaging.getToken() ?? "";
    // print("Firebase Token: $devicetoken");

    // Handle events
    handleForegroundMessages(context);
    handleBackgroundMessages(context);
    handleTerminatedMessages(context);
  }


 // Function to update the token on your server (You can replace this with your backend API)
  void updateTokenOnServer(String token, BuildContext context) {
      devicetoken = token;
    debugPrint("Sending updated token to server: $token");
    // Example: yourApiClient.updateDeviceToken(token);
  }



  /// Handle messages when the app is in the foreground
  void handleForegroundMessages(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final notification = message.notification;
      _processNotificationData(message.data);

      if (notification != null) {
        _showLocalNotification(notification);
      }
      // if (orderId.isNotEmpty) {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryDetail()));
      // }
    });
  }

  /// Handle messages when the app is opened from a notification (background)
  void handleBackgroundMessages(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      _processNotificationData(message.data);
      // if (orderId.isNotEmpty) {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryDetail()));
      // }
    });
  }

  /// Handle messages when the app was terminated and opened via a notification
  void handleTerminatedMessages(BuildContext context) async {
    RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _processNotificationData(initialMessage.data);
      // if (orderId.isNotEmpty) {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryDetail()));
      // }
    }
  }

  /// Process Notification Data
  void _processNotificationData(Map<String, dynamic> data) {
    // final response = FirebaseModel.fromJson(data);
    // orderId = response.orderId;
  }

  /// Show local notification when the app is in the foreground
  void _showLocalNotification(RemoteNotification notification) {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'high_importance_channel', 'channel_name',
      importance: Importance.high,
      priority: Priority.max,
      showWhen: false,
      icon: '@drawable/ic_notification',
    );
     
    const NotificationDetails platformDetails = NotificationDetails(android: androidDetails,  iOS: DarwinNotificationDetails(
      presentAlert: true, 
      presentBadge: true, 
      presentSound: true
    ));
    _localNotificationsPlugin.show(
      0, // Notification ID
      notification.title,
      notification.body,
      platformDetails
    );
  }
 
}