// To parse this JSON data, do
//
//     final projectDetailModel = projectDetailModelFromJson(jsonString);

import 'dart:convert';

ProjectDetailModel projectDetailModelFromJson(String str) => ProjectDetailModel.fromJson(json.decode(str));

String projectDetailModelToJson(ProjectDetailModel data) => json.encode(data.toJson());

class ProjectDetailModel {
  String? status;
  String? message;
  DataProject? data;
  int? taskCount;
  int? projectPercentage;

  ProjectDetailModel({
     this.status,
     this.message,
     this.data,
     this.taskCount,
     this.projectPercentage,
  });

  factory ProjectDetailModel.fromJson(Map<String, dynamic> json) => ProjectDetailModel(
    status: json["status"],
    message: json["message"],
    data: DataProject.fromJson(json["data"]),
    taskCount: json["task_count"],
    projectPercentage: json["project_percentage"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
    "task_count": taskCount,
    "project_percentage": projectPercentage,
  };
}

class DataProject {
  int? id;
  String? projectName;
  int? departmentId;
  int? isTech;
  int? isMarketing;
  String? description;
  String? colorCode;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  Department? department;
  Creator? creator;

  DataProject({
     this.id,
     this.projectName,
     this.departmentId,
     this.isTech,
     this.isMarketing,
     this.description,
     this.colorCode,
     this.createdBy,
     this.createdAt,
     this.updatedAt,
     this.department,
     this.creator,
  });

  factory DataProject.fromJson(Map<String, dynamic> json) => DataProject(
    id: json["id"],
    projectName: json["project_name"],
    departmentId: json["department_id"],
    isTech: json["is_tech"],
    isMarketing: json["is_marketing"],
    description: json["description"],
    colorCode: json["color_code"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    department: Department.fromJson(json["department"]),
    creator: Creator.fromJson(json["creator"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_name": projectName,
    "department_id": departmentId,
    "is_tech": isTech,
    "is_marketing": isMarketing,
    "description": description,
    "color_code": colorCode,
    "created_by": createdBy,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "department": department!.toJson(),
    "creator": creator!.toJson(),
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
  dynamic birthdate;
  bool isActive;
  String photo;
  dynamic bio;
  String fcmToken;
  String appToken;
  dynamic emailVerifiedAt;
  int startHour;
  int startMin;
  dynamic createdAt;
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
    required this.fcmToken,
    required this.appToken,
    required this.emailVerifiedAt,
    required this.startHour,
    required this.startMin,
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
    birthdate: json["birthdate"],
    isActive: json["isActive"],
    photo: json["photo"],
    bio: json["bio"],
    fcmToken: json["fcm_token"],
    appToken: json["app_token"],
    emailVerifiedAt: json["email_verified_at"],
    startHour: json["start_hour"],
    startMin: json["start_min"],
    createdAt: json["created_at"],
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
    "birthdate": birthdate,
    "isActive": isActive,
    "photo": photo,
    "bio": bio,
    "fcm_token": fcmToken,
    "app_token": appToken,
    "email_verified_at": emailVerifiedAt,
    "start_hour": startHour,
    "start_min": startMin,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Department {
  int id;
  String departmentName;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Department({
    required this.id,
    required this.departmentName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    departmentName: json["department_name"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "department_name": departmentName,
    "isActive": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
