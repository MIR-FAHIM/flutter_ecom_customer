// To parse this JSON data, do
//
//     final noticeListModel = noticeListModelFromJson(jsonString);

import 'dart:convert';

NoticeListModel noticeListModelFromJson(String str) => NoticeListModel.fromJson(json.decode(str));

String noticeListModelToJson(NoticeListModel data) => json.encode(data.toJson());

class NoticeListModel {
  String? status;
  List<NoticeDatum> data;

  NoticeListModel({
    required this.status,
    required this.data,
  });

  factory NoticeListModel.fromJson(Map<String, dynamic> json) => NoticeListModel(
    status: json["status"],
    data: List<NoticeDatum>.from(json["data"].map((x) => NoticeDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class NoticeDatum {
  int id;
  String title;
  String notice;
  bool isActive;
  bool highlight;
  dynamic colorCode;
  String type;
  int createdBy;
  dynamic startDate;
  dynamic endDate;
  DateTime createdAt;
  DateTime updatedAt;

  NoticeDatum({
    required this.id,
    required this.title,
    required this.notice,
    required this.isActive,
    required this.highlight,
    required this.colorCode,
    required this.type,
    required this.createdBy,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoticeDatum.fromJson(Map<String, dynamic> json) => NoticeDatum(
    id: json["id"],
    title: json["title"],
    notice: json["notice"],
    isActive: json["is_active"],
    highlight: json["highlight"],
    colorCode: json["color_code"],
    type: json["type"],
    createdBy: json["created_by"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "notice": notice,
    "is_active": isActive,
    "highlight": highlight,
    "color_code": colorCode,
    "type": type,
    "created_by": createdBy,
    "start_date": startDate,
    "end_date": endDate,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
