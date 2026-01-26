// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? status;
  String? message;
  ProfileData? data;

  ProfileModel({
     this.status,
     this.message,
     this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"],
    message: json["message"],
    data: ProfileData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class ProfileData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  int? designationId;
  int? roleId;
  int? departmentId;
  String? birthdate;
  bool? isActive;
  String? photo;
  String? bio;
  int? startHour;
  int? startMin;
  String? fcmToken;
  String? appToken;
  dynamic emailVerifiedAt;
  dynamic createdAt;
  DateTime? updatedAt;
  Department? designation;
  Department? role;
  Department? department;

  ProfileData({
     this.id,
     this.name,
     this.email,
     this.phone,
     this.address,
     this.designationId,
     this.roleId,
     this.departmentId,
     this.birthdate,
     this.isActive,
     this.photo,
     this.bio,
     this.startHour,
     this.startMin,
     this.fcmToken,
     this.appToken,
     this.emailVerifiedAt,
     this.createdAt,
     this.updatedAt,
     this.designation,
     this.role,
     this.department,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
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
    startHour: json["start_hour"],
    startMin: json["start_min"],
    fcmToken: json["fcm_token"],
    appToken: json["app_token"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
    designation: Department.fromJson(json["designation"]),
    role: Department.fromJson(json["role"]),
    department: Department.fromJson(json["department"]),
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
    "start_hour": startHour,
    "start_min": startMin,
    "fcm_token": fcmToken,
    "app_token": appToken,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "designation": designation!.toJson(),
    "role": role!.toJson(),
    "department": department!.toJson(),
  };
}

class Department {
  int id;
  String? departmentName;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String? designationName;
  String? roleName;

  Department({
    required this.id,
    this.departmentName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.designationName,
    this.roleName,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    departmentName: json["department_name"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    designationName: json["designation_name"],
    roleName: json["role_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "department_name": departmentName,
    "isActive": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "designation_name": designationName,
    "role_name": roleName,
  };
}
