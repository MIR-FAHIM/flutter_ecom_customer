// To parse this JSON data, do
//
//     final notificationListModel = notificationListModelFromJson(jsonString);

import 'dart:convert';

NotificationListModel notificationListModelFromJson(String str) => NotificationListModel.fromJson(json.decode(str));

String notificationListModelToJson(NotificationListModel data) => json.encode(data.toJson());

class NotificationListModel {
  String? status;
  List<NotificationData>? notifications;

  NotificationListModel({
     this.status,
     this.notifications,
  });

  factory NotificationListModel.fromJson(Map<String, dynamic> json) => NotificationListModel(
    status: json["status"],
    notifications: List<NotificationData>.from(json["notifications"].map((x) => NotificationData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "notifications": List<dynamic>.from(notifications!.map((x) => x.toJson())),
  };
}

class NotificationData {
  int id;
  String title;
  String subtitle;
  String type;
  bool isSeen;
  bool sendPush;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  NotificationData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.isSeen,
    required this.sendPush,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    type:json["type"] ?? "",
    isSeen: json["is_seen"],
    sendPush: json["send_push"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "type":type,
    "is_seen": isSeen,
    "send_push": sendPush,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}


