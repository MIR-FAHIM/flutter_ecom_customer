// To parse this JSON data, do
//
//     final prospectActivityModel = prospectActivityModelFromJson(jsonString);

import 'dart:convert';

ProspectActivityModel prospectActivityModelFromJson(String str) => ProspectActivityModel.fromJson(json.decode(str));

String prospectActivityModelToJson(ProspectActivityModel data) => json.encode(data.toJson());

class ProspectActivityModel {
  bool? status;
  List<DatumLog>? data;

  ProspectActivityModel({
     this.status,
     this.data,
  });

  factory ProspectActivityModel.fromJson(Map<String, dynamic> json) => ProspectActivityModel(
    status: json["status"],
    data: List<DatumLog>.from(json["data"].map((x) => DatumLog.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumLog {
  int id;
  int prospectId;
  dynamic relatedId;
  String activityType;
  String title;
  String notes;
  dynamic activityTime;
  CreatedBy createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic relatedTask;

  DatumLog({
    required this.id,
    required this.prospectId,
    required this.relatedId,
    required this.activityType,
    required this.title,
    required this.notes,
    required this.activityTime,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.relatedTask,
  });

  factory DatumLog.fromJson(Map<String, dynamic> json) => DatumLog(
    id: json["id"],
    prospectId: json["prospect_id"],
    relatedId: json["related_id"],
    activityType: json["activity_type"],
    title: json["title"]?? "No Title",
    notes: json["notes"] ?? "No Note Yet",
    activityTime: json["activity_time"],
    createdBy: CreatedBy.fromJson(json["created_by"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    relatedTask: json["related_task"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prospect_id": prospectId,
    "related_id": relatedId,
    "activity_type": activityType,
    "title": title,
    "notes": notes,
    "activity_time": activityTime,
    "created_by": createdBy.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "related_task": relatedTask,
  };
}

class CreatedBy {
  int id;
  String name;
  String email;
  String phone;
  String address;
  int designationId;
  int roleId;
  int departmentId;
  DateTime? birthdate;
  bool isActive;
  String photo;
  String? bio;
  String? fcmToken;
  String appToken;
  dynamic emailVerifiedAt;
  int startHour;
  int startMin;
  DateTime? createdAt;
  DateTime updatedAt;

  CreatedBy({
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
    required this.fcmToken,
    required this.appToken,
    required this.emailVerifiedAt,
    required this.startHour,
    required this.startMin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    designationId: json["designation_id"],
    roleId: json["role_id"],
    departmentId: json["department_id"],
    birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
    isActive: json["isActive"],
    photo: json["photo"],
    bio: json["bio"],
    fcmToken: json["fcm_token"],
    appToken: json["app_token"],
    emailVerifiedAt: json["email_verified_at"],
    startHour: json["start_hour"],
    startMin: json["start_min"],
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
    "birthdate": birthdate?.toIso8601String(),
    "isActive": isActive,
    "photo": photo,
    "bio": bio,
    "fcm_token": fcmToken,
    "app_token": appToken,
    "email_verified_at": emailVerifiedAt,
    "start_hour": startHour,
    "start_min": startMin,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
