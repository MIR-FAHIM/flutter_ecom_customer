// To parse this JSON data, do
//
//     final attendanceByDateModel = attendanceByDateModelFromJson(jsonString);

import 'dart:convert';

AttendanceByDateModel attendanceByDateModelFromJson(String str) => AttendanceByDateModel.fromJson(json.decode(str));

String attendanceByDateModelToJson(AttendanceByDateModel data) => json.encode(data.toJson());

class AttendanceByDateModel {
  String? status;
  List<DatumAttendanceDate>? data;

  AttendanceByDateModel({
     this.status,
     this.data,
  });

  factory AttendanceByDateModel.fromJson(Map<String, dynamic> json) => AttendanceByDateModel(
    status: json["status"],
    data: List<DatumAttendanceDate>.from(json["data"].map((x) => DatumAttendanceDate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumAttendanceDate {
  Employee? employee;
  Attendance? attendance;

  DatumAttendanceDate({
     this.employee,
     this.attendance,
  });

  factory DatumAttendanceDate.fromJson(Map<String, dynamic> json) => DatumAttendanceDate(
    employee: Employee.fromJson(json["employee"]),
    attendance: json["attendance"] == null ? null : Attendance.fromJson(json["attendance"]),
  );

  Map<String, dynamic> toJson() => {
    "employee": employee!.toJson(),
    "attendance": attendance!.toJson(),
  };
}

class Attendance {
  int id;
  int userId;
  DateTime? checkInTime;
  String checkInLocation;
  int isLate;
  int isWorkFromHome;
  String checkInLat;
  String checkInLon;
  DateTime? checkOutTime;
  String? checkOutLat;
  String? checkOutLon;
  String? checkOutLocation;
  String? lateReason;
  String? earlyLeaveReason;
  int isEarlyLeave;
  int fromField;
  int? totalDuration;
  DateTime? createdAt;
  DateTime? updatedAt;

  Attendance({
    required this.id,
    required this.userId,
    this.checkInTime,
    required this.checkInLocation,
    required this.isLate,
    required this.isWorkFromHome,
    required this.checkInLat,
    required this.checkInLon,
    this.checkOutTime,
    this.checkOutLat,
    this.checkOutLon,
    this.checkOutLocation,
    this.lateReason,
    this.earlyLeaveReason,
    required this.isEarlyLeave,
    required this.fromField,
    this.totalDuration,
    this.createdAt,
    this.updatedAt,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    id: json["id"] ?? 0,
    userId: json["user_id"] ?? 0,
    checkInTime: json["check_in_time"] != null
        ? DateTime.tryParse(json["check_in_time"])
        : null,
    checkInLocation: json["check_in_location"] ?? '',
    isLate: json["is_late"] ?? 0,
    isWorkFromHome: json["is_work_from_home"] ?? 0,
    checkInLat: json["check_in_lat"] ?? '',
    checkInLon: json["check_in_lon"] ?? '',
    checkOutTime: json["check_out_time"] != null
        ? DateTime.tryParse(json["check_out_time"])
        : null,
    checkOutLat: json["check_out_lat"] as String?,
    checkOutLon: json["check_out_lon"] as String?,
    checkOutLocation: json["check_out_location"] as String?,
    lateReason: json["late_reason"] as String?,
    earlyLeaveReason: json["early_leave_reason"] as String?,
    isEarlyLeave: json["is_early_leave"] ?? 0,
    fromField: json["from_field"] ?? 0,
    totalDuration: json["total_duration"] as int?,
    createdAt: json["created_at"] != null
        ? DateTime.tryParse(json["created_at"])
        : null,
    updatedAt: json["updated_at"] != null
        ? DateTime.tryParse(json["updated_at"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "check_in_time": checkInTime?.toIso8601String(),
    "check_in_location": checkInLocation,
    "is_late": isLate,
    "is_work_from_home": isWorkFromHome,
    "check_in_lat": checkInLat,
    "check_in_lon": checkInLon,
    "check_out_time": checkOutTime?.toIso8601String(),
    "check_out_lat": checkOutLat,
    "check_out_lon": checkOutLon,
    "check_out_location": checkOutLocation,
    "late_reason": lateReason,
    "early_leave_reason": earlyLeaveReason,
    "is_early_leave": isEarlyLeave,
    "from_field": fromField,
    "total_duration": totalDuration,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}




class Employee {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  int? designationId;
  int? roleId;
  int? departmentId;
  DateTime? birthdate;
  bool? isActive;
  String? photo;
  String? bio;
  int? startHour;
  int? startMin;
  String? fcmToken;
  String? appToken;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Employee({
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
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    name: json["name"] ?? "",
    email: json["email"]?? "",
    phone: json["phone"]?? "",
    address: json["address"]?? "",
    designationId: json["designation_id"]?? 1,
    roleId: json["role_id"]?? 1,
    departmentId: json["department_id"]?? 1,
    birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
    isActive: json["isActive"]?? 1,
    photo: json["photo"]?? "",
    bio: json["bio"]?? "",
    startHour: json["start_hour"]?? 0,
    startMin: json["start_min"]?? 0,
    fcmToken: json["fcm_token"]?? "",
    appToken: json["app_token"]?? "",
    emailVerifiedAt: json["email_verified_at"]== null ? null : DateTime.parse(json["email_verified_at"]),
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
    "start_hour": startHour,
    "start_min": startMin,
    "fcm_token": fcmToken,
    "app_token": appToken,
    "email_verified_at": emailVerifiedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}


