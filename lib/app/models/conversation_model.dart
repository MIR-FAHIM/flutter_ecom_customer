import 'dart:convert';

ChatConversationRoomModel chatConversationRoomModelFromJson(String str) =>
    ChatConversationRoomModel.fromJson(json.decode(str));

String chatConversationRoomModelToJson(ChatConversationRoomModel data) =>
    json.encode(data.toJson());

class ChatConversationRoomModel {
  String? status;
  List<DatumConversation>? data;

  ChatConversationRoomModel({this.status, this.data});

  factory ChatConversationRoomModel.fromJson(Map<String, dynamic> json) =>
      ChatConversationRoomModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<DatumConversation>.from(
            json["data"].map((x) => DatumConversation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.map((x) => x.toJson()).toList(),
  };
}

class DatumConversation {
  int id;
  int? prospectId;
  dynamic generalId;
  int? projectId;
  dynamic clientId;
  String type;
  String roomName;
  dynamic coverPhoto;
  DateTime createdAt;
  DateTime updatedAt;
  List<UserConversation> users;

  DatumConversation({
    required this.id,
    this.prospectId,
    this.generalId,
    this.projectId,
    this.clientId,
    required this.type,
    required this.roomName,
    this.coverPhoto,
    required this.createdAt,
    required this.updatedAt,
    required this.users,
  });

  factory DatumConversation.fromJson(Map<String, dynamic> json) =>
      DatumConversation(
        id: json["id"],
        prospectId: json["prospect_id"],
        generalId: json["general_id"],
        projectId: json["project_id"],
        clientId: json["client_id"],
        type: json["type"],
        roomName: json["room_name"],
        coverPhoto: json["cover_photo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        users: json["users"] == null
            ? []
            : List<UserConversation>.from(
            json["users"].map((x) => UserConversation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prospect_id": prospectId,
    "general_id": generalId,
    "project_id": projectId,
    "client_id": clientId,
    "type": type,
    "room_name": roomName,
    "cover_photo": coverPhoto,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "users": users.map((x) => x.toJson()).toList(),
  };
}

class UserConversation {
  int id;
  int employeeId;
  int projectId;
  int isActive;
  int notifyActive;
  dynamic role;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Employee employee;

  UserConversation({
    required this.id,
    required this.employeeId,
    required this.projectId,
    required this.isActive,
    required this.notifyActive,
    this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.employee,
  });

  factory UserConversation.fromJson(Map<String, dynamic> json) =>
      UserConversation(
        id: json["id"],
        employeeId: json["employee_id"],
        projectId: json["project_id"],
        isActive: json["isActive"],
        notifyActive: json["notify_active"],
        role: json["role"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        employee: Employee.fromJson(json["employee"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_id": employeeId,
    "project_id": projectId,
    "isActive": isActive,
    "notify_active": notifyActive,
    "role": role,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "employee": employee.toJson(),
  };
}

class Employee {
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
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime updatedAt;

  Employee({
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
    this.fcmToken,
    this.appToken,
    this.emailVerifiedAt,
    this.createdAt,
    required this.updatedAt,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    designationId: json["designation_id"],
    roleId: json["role_id"],
    departmentId: json["department_id"],
    birthdate: json["birthdate"] == null ? DateTime.now():DateTime.parse(json["birthdate"]),
    isActive: json["isActive"],
    photo: json["photo"],
    bio: json["bio"] ?? 'No Bio',
    startHour: json["start_hour"],
    startMin: json["start_min"],
    fcmToken: json["fcm_token"],
    appToken: json["app_token"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt:
    json["created_at"] == null ? null : DateTime.tryParse(json["created_at"]),
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
