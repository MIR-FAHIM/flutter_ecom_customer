// To parse this JSON data, do
//
//     final taskFollowUpModel = taskFollowUpModelFromJson(jsonString);

import 'dart:convert';

TaskFollowUpModel taskFollowUpModelFromJson(String str) => TaskFollowUpModel.fromJson(json.decode(str));

String taskFollowUpModelToJson(TaskFollowUpModel data) => json.encode(data.toJson());

class TaskFollowUpModel {
  String? status;
  List<DatumFollowupTask>? data;

  TaskFollowUpModel({
     this.status,
     this.data,
  });

  factory TaskFollowUpModel.fromJson(Map<String, dynamic> json) => TaskFollowUpModel(
    status: json["status"],
    data: List<DatumFollowupTask>.from(json["data"].map((x) => DatumFollowupTask.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumFollowupTask {
  int id;
  int taskId;
  String followupTitle;
  String followupDetails;
  String type;
  String status;
  int createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  Creator creator;

  DatumFollowupTask({
    required this.id,
    required this.taskId,
    required this.followupTitle,
    required this.followupDetails,
    required this.type,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.creator,
  });

  factory DatumFollowupTask.fromJson(Map<String, dynamic> json) => DatumFollowupTask(
    id: json["id"],
    taskId: json["task_id"],
    followupTitle: json["followup_title"],
    followupDetails: json["followup_details"],
    type: json["type"],
    status: json["status"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    creator: Creator.fromJson(json["creator"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task_id": taskId,
    "followup_title": followupTitle,
    "followup_details": followupDetails,
    "type": type,
    "status": status,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "creator": creator.toJson(),
  };
}

class Creator {
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
  String fcmToken;
  String appToken;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Creator({
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

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    designationId: json["designation_id"],
    roleId: json["role_id"],
    departmentId: json["department_id"],
    birthdate: DateTime.parse(json["birthdate"]),
    isActive: json["isActive"],
    photo: json["photo"],
    bio: json["bio"],
    startHour: json["start_hour"],
    startMin: json["start_min"],
    fcmToken: json["fcm_token"],
    appToken: json["app_token"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
