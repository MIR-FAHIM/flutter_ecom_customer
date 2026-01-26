// To parse this JSON data, do
//
//     final todayAttendancDashModel = todayAttendancDashModelFromJson(jsonString);

import 'dart:convert';

TodayAttendancDashModel todayAttendancDashModelFromJson(String str) => TodayAttendancDashModel.fromJson(json.decode(str));

String todayAttendancDashModelToJson(TodayAttendancDashModel data) => json.encode(data.toJson());

class TodayAttendancDashModel {
  String? status;
  String? message;
  bool? checkedIn;
  Attendance? attendance;

  TodayAttendancDashModel({
     this.status,
     this.message,
     this.checkedIn,
     this.attendance,
  });

  factory TodayAttendancDashModel.fromJson(Map<String, dynamic> json) => TodayAttendancDashModel(
    status: json["status"],
    message: json["message"],
    checkedIn: json["checked_in"],
    attendance: Attendance.fromJson(json["attendance"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "checked_in": checkedIn,
    "attendance": attendance!.toJson(),
  };
}

class Attendance {
  int id;
  int userId;
  String checkInTime;
  String checkInLocation;
  int isLate;
  int isWorkFromHome;
  String checkInLat;
  String checkInLon;
  String checkOutTime;
  String checkOutLat;
  String checkOutLon;
  String checkOutLocation;
  String lateReason;
  String earlyLeaveReason;
  int isEarlyLeave;
  int fromField;
  int totalDuration;
  String createdAt;
  String updatedAt;

  Attendance({
    required this.id,
    required this.userId,
    required this.checkInTime,
    required this.checkInLocation,
    required this.isLate,
    required this.isWorkFromHome,
    required this.checkInLat,
    required this.checkInLon,
    required this.checkOutTime,
    required this.checkOutLat,
    required this.checkOutLon,
    required this.checkOutLocation,
    required this.lateReason,
    required this.earlyLeaveReason,
    required this.isEarlyLeave,
    required this.fromField,
    required this.totalDuration,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    id: json["id"],
    userId: json["user_id"],
    checkInTime: json["check_in_time"],
    checkInLocation: json["check_in_location"],
    isLate: json["is_late"],
    isWorkFromHome: json["is_work_from_home"],
    checkInLat: json["check_in_lat"],
    checkInLon: json["check_in_lon"],
    checkOutTime: json["check_out_time"] ?? "Do not forget to check out",
    checkOutLat: json["check_out_lat"] ?? "0.00",
    checkOutLon: json["check_out_lon"] ?? "0.00",
    checkOutLocation: json["check_out_location"] ?? "No Data",
    lateReason: json["late_reason"] ?? "No Data",
    earlyLeaveReason: json["early_leave_reason"] ?? "No Data",
    isEarlyLeave: json["is_early_leave"],
    fromField: json["from_field"],
    totalDuration: json["total_duration"] ?? 0,
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "check_in_time": checkInTime,
    "check_in_location": checkInLocation,
    "is_late": isLate,
    "is_work_from_home": isWorkFromHome,
    "check_in_lat": checkInLat,
    "check_in_lon": checkInLon,
    "check_out_time": checkOutTime,
    "check_out_lat": checkOutLat,
    "check_out_lon": checkOutLon,
    "check_out_location": checkOutLocation,
    "late_reason": lateReason,
    "early_leave_reason": earlyLeaveReason,
    "is_early_leave": isEarlyLeave,
    "from_field": fromField,
    "total_duration": totalDuration,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
