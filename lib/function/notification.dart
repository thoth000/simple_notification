import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future initializeNotification() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('notification_icon');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> notificationContent({String title, String content, int noteID}) async {
  //通知頻度が早すぎると上手くグループ化しない
  const String groupChannelId = 'grouped channel id';
  const String groupChannelName = 'grouped channel name';
  const String groupChannelDescription = 'grouped channel description';
  const AndroidNotificationDetails firstNotificationAndroidSpecifics =
      AndroidNotificationDetails(
    groupChannelId,
    groupChannelName,
    groupChannelDescription,
    importance: Importance.low,
    priority: Priority.low,
    setAsGroupSummary: true,
  );
  const NotificationDetails firstNotificationPlatformSpecifics =
      NotificationDetails(
    android: firstNotificationAndroidSpecifics,
  );
  await FlutterLocalNotificationsPlugin().show(
    noteID,
    title,
    content,
    firstNotificationPlatformSpecifics,
  );
}
