// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  String? status;
  String? message;
  List<ChatDatum>? data;

  ChatModel({
     this.status,
     this.message,
     this.data,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    status: json["status"],
    message: json["message"],
    data: List<ChatDatum>.from(json["data"].map((x) => ChatDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ChatDatum {
  int id;
  int conversationRoomId;
  int senderId;
  int receiverId;
  String message;
  String messageType;
  String filePath;
  String fileName;
  String fileSize;
  bool isRead;
  bool isDelivered;
  bool isSeen;
  DateTime? readAt;
  String deliveredAt;
  String seenAt;
  bool isEdited;
  bool isDeleted;
  int parentId;
  DateTime createdAt;
  DateTime updatedAt;
  Sender sender;
  dynamic receiver;

  ChatDatum({
    required this.id,
    required this.conversationRoomId,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.messageType,
    required this.filePath,
    required this.fileName,
    required this.fileSize,
    required this.isRead,
    required this.isDelivered,
    required this.isSeen,
    required this.readAt,
    required this.deliveredAt,
    required this.seenAt,
    required this.isEdited,
    required this.isDeleted,
    required this.parentId,
    required this.createdAt,
    required this.updatedAt,
    required this.sender,
    required this.receiver,
  });

  factory ChatDatum.fromJson(Map<String, dynamic> json) => ChatDatum(
    id: json["id"],
    conversationRoomId: json["conversation_room_id"],
    senderId: json["sender_id"],
    receiverId: json["receiver_id"] ?? 0,
    message: json["message"],
    messageType: json["message_type"] ?? "text",
    filePath: json["file_path"] ?? "No Data",
    fileName: json["file_name"]?? "No Data",
    fileSize: json["file_size"]?? "No Data",
    isRead: json["is_read"],
    isDelivered: json["is_delivered"],
    isSeen: json["is_seen"],
    readAt: json["read_at"] == null ? null : DateTime.parse(json["read_at"]),
    deliveredAt: json["delivered_at"]?? '',
    seenAt: json["seen_at"] ?? "",
    isEdited: json["is_edited"],
    isDeleted: json["is_deleted"],
    parentId: json["parent_id"] ?? 0,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    sender: Sender.fromJson(json["sender"]),
    receiver: json["receiver"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "conversation_room_id": conversationRoomId,
    "sender_id": senderId,
    "receiver_id": receiverId,
    "message": message,
    "message_type": messageType,
    "file_path": filePath,
    "file_name": fileName,
    "file_size": fileSize,
    "is_read": isRead,
    "is_delivered": isDelivered,
    "is_seen": isSeen,
    "read_at": readAt?.toIso8601String(),
    "delivered_at": deliveredAt,
    "seen_at": seenAt,
    "is_edited": isEdited,
    "is_deleted": isDeleted,
    "parent_id": parentId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "sender": sender.toJson(),
    "receiver": receiver,
  };
}



class Sender {
  int id;
  String name;
  String email;
  String phone;
  String address;
  int designationId;
  int roleId;
  int departmentId;
  DateTime birthdate;
  bool isActive;
  String photo;
  String bio;
  int startHour;
  int startMin;
  String? fcmToken;
  String? appToken;
  String? emailVerifiedAt;
  DateTime? createdAt;
  DateTime updatedAt;

  Sender({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.designationId,
    required this.roleId,
    required this.departmentId,
    required this.birthdate,
    required this.isActive,
    required this.photo,
    required this.bio,
    required this.startHour,
    required this.startMin,
    required this.fcmToken,
    required this.appToken,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
    id: json["id"],
    name: json["name"]!,
    email: json["email"] ?? "No Data",
    phone: json["phone"] ?? "No data",
    address: json["address"] ?? "No Data",
    designationId: json["designation_id"],
    roleId: json["role_id"],
    departmentId: json["department_id"],
    birthdate: DateTime.parse(json["birthdate"]),
    isActive: json["isActive"],
    photo: json["photo"] ?? "No Data",
    bio: json["bio"] ?? "No Data",
    startHour: json["start_hour"],
    startMin: json["start_min"],
    fcmToken: json["fcm_token"] ?? "No Data",
    appToken: json["app_token"] ?? "No Data",
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "designation_id": designationId,
    "role_id": roleId,
    "department_id": departmentId,
    "birthdate": birthdate.toIso8601String(),
    "isActive": isActive,
    "photo": photo,
    "bio": bio,
    "start_hour": startHour,
    "start_min": startMin,
    "fcm_token": fcmToken,
    "app_token": appToken,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
