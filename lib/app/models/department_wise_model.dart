import 'dart:convert';

DepartmentWiseModel departmentWiseModelFromJson(String str) =>
    DepartmentWiseModel.fromJson(json.decode(str));

String departmentWiseModelToJson(DepartmentWiseModel data) =>
    json.encode(data.toJson());

class DepartmentWiseModel {
  String? status;
  String? message;
  List<DatumDepartmentWise>? data;

  DepartmentWiseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DepartmentWiseModel.fromJson(Map<String, dynamic> json) =>
      DepartmentWiseModel(
        status: json["status"] ?? '',
        message: json["message"] ?? '',
        data: json["data"] == null
            ? []
            : List<DatumDepartmentWise>.from(
            json["data"].map((x) => DatumDepartmentWise.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumDepartmentWise {
  int? id;
  String? departmentName;
  int? employeeCount;
  int? taskCount;
  List<User>? users;

  DatumDepartmentWise({
    this.id,
    this.departmentName,
    this.employeeCount,
    this.taskCount,
    this.users,
  });

  factory DatumDepartmentWise.fromJson(Map<String, dynamic> json) =>
      DatumDepartmentWise(
        id: json["id"] ?? 0,
        departmentName: json["department_name"] ?? "Unknown Department",
        employeeCount: json["employee_count"] ?? 0,
        taskCount: json["task_count"] ?? 0,
        users: json["users"] == null
            ? []
            : List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "department_name": departmentName,
    "employee_count": employeeCount,
    "task_count": taskCount,
    "users": users == null
        ? []
        : List<dynamic>.from(users!.map((x) => x.toJson())),
  };
}

class User {
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
  int startHour;
  int startMin;
  String? fcmToken;
  String appToken;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
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
    this.bio,
    required this.startHour,
    required this.startMin,
    this.fcmToken,
    required this.appToken,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    name: (json["name"] ?? '').trim(),
    email: json["email"] ?? '',
    phone: json["phone"] ?? '',
    address: json["address"] ?? '',
    designationId: json["designation_id"] ?? 0,
    roleId: json["role_id"] ?? 0,
    departmentId: json["department_id"] ?? 0,
    birthdate: json["birthdate"] == null
        ? null
        : DateTime.tryParse(json["birthdate"]),
    isActive: json["isActive"] ?? false,
    photo: json["photo"] ?? '',
    bio: json["bio"],
    startHour: json["start_hour"] ?? 0,
    startMin: json["start_min"] ?? 0,
    fcmToken: json["fcm_token"],
    appToken: json["app_token"] ?? '',
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.tryParse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? DateTime.now()
        : DateTime.parse(json["updated_at"]),
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
    "start_hour": startHour,
    "start_min": startMin,
    "fcm_token": fcmToken,
    "app_token": appToken,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
