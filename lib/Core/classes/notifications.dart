import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void init() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification:
                (int i, String? s, String? s2, String? s3) {});
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse:
            (NotificationResponse response) {},
        onDidReceiveNotificationResponse: (NotificationResponse response) {});
  }

  static Future showNotification(FlutterLocalNotificationsPlugin notifications,
      {required String title,
      required String body,
      int id = 0,
      required NotificationDetails type}) async {
    notifications.show(id, title, body, type);
  }

  static Future showOnGoingNotification(
      FlutterLocalNotificationsPlugin notifications,
      {required String title,
      required String body,
      int id = 0,
      required NotificationDetails type}) async {
    notifications.show(id, title, body, onGoing);
  }

  static NotificationDetails get onGoing {
    const androidChannelNotification = AndroidNotificationDetails(
        "channel id", 'channel name',
        importance: Importance.max,
        priority: Priority.high,
        ongoing: true,
        autoCancel: false);
    const iosChannelNotification = DarwinNotificationDetails();
    return const NotificationDetails(
        android: androidChannelNotification, iOS: iosChannelNotification);
  }
}
