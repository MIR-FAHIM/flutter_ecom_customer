// To parse this JSON data, do
//
//     final userMonthAttendanceModel = userMonthAttendanceModelFromJson(jsonString);

import 'dart:convert';

UserMonthAttendanceModel userMonthAttendanceModelFromJson(String str) => UserMonthAttendanceModel.fromJson(json.decode(str));

String userMonthAttendanceModelToJson(UserMonthAttendanceModel data) => json.encode(data.toJson());

class UserMonthAttendanceModel {
  String? status;
  List<AttendanceDate>? dates;

  UserMonthAttendanceModel({
     this.status,
     this.dates,
  });

  factory UserMonthAttendanceModel.fromJson(Map<String, dynamic> json) => UserMonthAttendanceModel(
    status: json["status"],
    dates: List<AttendanceDate>.from(json["dates"].map((x) => AttendanceDate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "dates": List<dynamic>.from(dates!.map((x) => x.toJson())),
  };
}

class AttendanceDate {
  int date;
  String weekday;
  Attendance? attendance;
  bool weekend;

  AttendanceDate({
    required this.date,
    required this.weekday,
    required this.attendance,
    required this.weekend,
  });

  factory AttendanceDate.fromJson(Map<String, dynamic> json) => AttendanceDate(
    date: json["date"],
    weekday: json["weekday"],
    attendance: json["attendance"] == null ? null : Attendance.fromJson(json["attendance"]),
    weekend: json["weekend"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "weekday": weekday,
    "attendance": attendance?.toJson(),
    "weekend": weekend,
  };
}

class Attendance {
  DateTime checkInTime;
  DateTime? checkOutTime;
  String checkInLocation;
  String? checkOutLocation;
  String checkInLat;
  String checkInLon;
  String? checkOutLat;
  String? checkOutLon;
  int? totalDuration;
  int isLate;
  int isEarlyLeave;
  int fromField;

  Attendance({
    required this.checkInTime,
    required this.checkOutTime,
    required this.checkInLocation,
    required this.checkOutLocation,
    required this.checkInLat,
    required this.checkInLon,
    required this.checkOutLat,
    required this.checkOutLon,
    required this.totalDuration,
    required this.isLate,
    required this.isEarlyLeave,
    required this.fromField,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    checkInTime: DateTime.parse(json["check_in_time"]),
    checkOutTime: json["check_out_time"] == null ? null : DateTime.parse(json["check_out_time"]),
    checkInLocation: json["check_in_location"],
    checkOutLocation: json["check_out_location"],
    checkInLat: json["check_in_lat"],
    checkInLon: json["check_in_lon"],
    checkOutLat: json["check_out_lat"],
    checkOutLon: json["check_out_lon"],
    totalDuration: json["total_duration"],
    isLate: json["is_late"],
    isEarlyLeave: json["is_early_leave"],
    fromField: json["from_field"],
  );

  Map<String, dynamic> toJson() => {
    "check_in_time": checkInTime.toIso8601String(),
    "check_out_time": checkOutTime?.toIso8601String(),
    "check_in_location": checkInLocation,
    "check_out_location": checkOutLocation,
    "check_in_lat": checkInLat,
    "check_in_lon": checkInLon,
    "check_out_lat": checkOutLat,
    "check_out_lon": checkOutLon,
    "total_duration": totalDuration,
    "is_late": isLate,
    "is_early_leave": isEarlyLeave,
    "from_field": fromField,
  };
}
