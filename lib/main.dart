import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Notifications',
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    // Initialize notifications for Android only
    var initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings(
          '@mipmap/ic_launcher'), // Android initialization
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Method to show a simple notification
  Future<void> _showNotification() async {
    var androidDetails = AndroidNotificationDetails(
      'channel_id', // Channel ID
      'channel_name', // Channel Name
      channelDescription: 'This is a sample notification channel',
      importance: Importance.high,
      priority: Priority.high,
    );

    var platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'Hello, World!', // Notification title
      'This is a simple notification', // Notification body
      platformDetails,
      payload: 'Test Payload', // Optional payload
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Local Notifications"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showNotification,
          child: Text("Show Notification"),
        ),
      ),
    );
  }
}
