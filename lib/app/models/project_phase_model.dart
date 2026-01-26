// To parse this JSON data, do
//
//     final projectPhaseModel = projectPhaseModelFromJson(jsonString);

import 'dart:convert';

ProjectPhaseModel projectPhaseModelFromJson(String str) => ProjectPhaseModel.fromJson(json.decode(str));

String projectPhaseModelToJson(ProjectPhaseModel data) => json.encode(data.toJson());

class ProjectPhaseModel {
  bool? success;
  List<DatumPhase>? data;

  ProjectPhaseModel({
     this.success,
     this.data,
  });

  factory ProjectPhaseModel.fromJson(Map<String, dynamic> json) => ProjectPhaseModel(
    success: json["success"],
    data: List<DatumPhase>.from(json["data"].map((x) => DatumPhase.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumPhase {
  int id;
  int projectId;
  String phaseName;
  int phaseOrderId;
  String description;
  String status;
  int priority;
  DateTime startDate;
  DateTime endDate;
  String phaseCompletionPercentage;
  DateTime createdAt;
  DateTime updatedAt;
  int totalTaskCount;
  int completedTaskCount;

  DatumPhase({
    required this.id,
    required this.projectId,
    required this.phaseName,
    required this.phaseOrderId,
    required this.description,
    required this.status,
    required this.priority,
    required this.startDate,
    required this.endDate,
    required this.phaseCompletionPercentage,
    required this.createdAt,
    required this.updatedAt,
    required this.totalTaskCount,
    required this.completedTaskCount,
  });

  factory DatumPhase.fromJson(Map<String, dynamic> json) => DatumPhase(
    id: json["id"],
    projectId: json["project_id"],
    phaseName: json["phase_name"],
    phaseOrderId: json["phase_order_id"],
    description: json["description"],
    status: json["status"],
    priority: json["priority"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    phaseCompletionPercentage: json["phase_completion_percentage"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    totalTaskCount: json["total_task_count"],
    completedTaskCount: json["completed_task_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_id": projectId,
    "phase_name": phaseName,
    "phase_order_id": phaseOrderId,
    "description": description,
    "status": status,
    "priority": priority,
    "start_date": startDate.toIso8601String(),
    "end_date": endDate.toIso8601String(),
    "phase_completion_percentage": phaseCompletionPercentage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "total_task_count": totalTaskCount,
    "completed_task_count": completedTaskCount,
  };
}
