// To parse this JSON data, do
//
//     final getTaskStatusModel = getTaskStatusModelFromJson(jsonString);

import 'dart:convert';

GetTaskStatusModel getTaskStatusModelFromJson(String str) => GetTaskStatusModel.fromJson(json.decode(str));

String getTaskStatusModelToJson(GetTaskStatusModel data) => json.encode(data.toJson());

class GetTaskStatusModel {
  String? status;
  String? message;
  List<DatumStatus>? data;

  GetTaskStatusModel({
     this.status,
     this.message,
     this.data,
  });

  factory GetTaskStatusModel.fromJson(Map<String, dynamic> json) => GetTaskStatusModel(
    status: json["status"],
    message: json["message"],
    data: List<DatumStatus>.from(json["data"].map((x) => DatumStatus.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumStatus {
  int? id;
  String? statusName;
  int? departmentId;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  DatumStatus({
     this.id,
     this.statusName,
     this.departmentId,
     this.isActive,
     this.createdAt,
     this.updatedAt,
  });

  factory DatumStatus.fromJson(Map<String, dynamic> json) => DatumStatus(
    id: json["id"],
    statusName: json["status_name"],
    departmentId: json["department_id"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status_name": statusName,
    "department_id": departmentId,
    "isActive": isActive,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
