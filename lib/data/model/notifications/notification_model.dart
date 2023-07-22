class NotificationsModel {
  final String notificationId;
  final String notificationTitle;
  final String notificationSubTitle;
  final String notificationUserId;

  NotificationsModel(
      {required this.notificationId,
      required this.notificationTitle,
      required this.notificationSubTitle,
      required this.notificationUserId});
  factory NotificationsModel.fromJson(Map<String, dynamic> jsonData) =>
      NotificationsModel(
          notificationId: jsonData['notification_id'],
          notificationTitle: jsonData['notification_title'],
          notificationSubTitle: jsonData['notification_body'],
          notificationUserId: jsonData['notification_userId']);
}
