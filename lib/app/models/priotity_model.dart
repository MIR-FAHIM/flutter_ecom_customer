// To parse this JSON data, do
//
//     final priorityModel = priorityModelFromJson(jsonString);

import 'dart:convert';

PriorityModel priorityModelFromJson(String str) => PriorityModel.fromJson(json.decode(str));

String priorityModelToJson(PriorityModel data) => json.encode(data.toJson());

class PriorityModel {
  String? status;
  String? message;
  List<PriorityDatum>? data;

  PriorityModel({
     this.status,
     this.message,
     this.data,
  });

  factory PriorityModel.fromJson(Map<String, dynamic> json) => PriorityModel(
    status: json["status"],
    message: json["message"],
    data: List<PriorityDatum>.from(json["data"].map((x) => PriorityDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PriorityDatum {
  int id;
  String priorityName;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  PriorityDatum({
    required this.id,
    required this.priorityName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PriorityDatum.fromJson(Map<String, dynamic> json) => PriorityDatum(
    id: json["id"],
    priorityName: json["priority_name"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "priority_name": priorityName,
    "isActive": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
