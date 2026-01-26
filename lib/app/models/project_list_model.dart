// To parse this JSON data, do
//
//     final projectListModel = projectListModelFromJson(jsonString);

import 'dart:convert';

ProjectListModel projectListModelFromJson(String str) => ProjectListModel.fromJson(json.decode(str));

String projectListModelToJson(ProjectListModel data) => json.encode(data.toJson());

class ProjectListModel {
  String? status;
  String? message;
  List<ProjectDatum>? data;

  ProjectListModel({
     this.status,
     this.message,
     this.data,
  });

  factory ProjectListModel.fromJson(Map<String, dynamic> json) => ProjectListModel(
    status: json["status"],
    message: json["message"],
    data: List<ProjectDatum>.from(json["data"].map((x) => ProjectDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ProjectDatum {
  int id;
  String projectName;
  int departmentId;
  int isTech;
  int isMarketing;
  String description;
  String colorCode;
  int createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int taskCount;
  int phaseCount;
  int projectPercentage;
  Department department;
  List<Task> tasks;
  List<Phase> phases;

  ProjectDatum({
    required this.id,
    required this.projectName,
    required this.departmentId,
    required this.isTech,
    required this.isMarketing,
    required this.description,
    required this.colorCode,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.taskCount,
    required this.phaseCount,
    required this.projectPercentage,
    required this.department,
    required this.tasks,
    required this.phases,
  });

  factory ProjectDatum.fromJson(Map<String, dynamic> json) => ProjectDatum(
    id: json["id"],
    projectName: json["project_name"],
    departmentId: json["department_id"],
    isTech: json["is_tech"],
    isMarketing: json["is_marketing"],
    description: json["description"],
    colorCode: json["color_code"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    taskCount: json["taskCount"],
    phaseCount: json["phaseCount"],
    projectPercentage: json["projectPercentage"],
    department: Department.fromJson(json["department"]),
    tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
    phases: List<Phase>.from(json["phases"].map((x) => Phase.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_name": projectName,
    "department_id": departmentId,
    "is_tech": isTech,
    "is_marketing": isMarketing,
    "description": description,
    "color_code": colorCode,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "taskCount": taskCount,
    "phaseCount": phaseCount,
    "projectPercentage": projectPercentage,
    "department": department.toJson(),
    "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
    "phases": List<dynamic>.from(phases.map((x) => x.toJson())),
  };
}

class Department {
  int id;
  String departmentName;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Department({
    required this.id,
    required this.departmentName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    departmentName: json["department_name"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "department_name": departmentName,
    "isActive": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Phase {
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

  Phase({
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
  });

  factory Phase.fromJson(Map<String, dynamic> json) => Phase(
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
  };
}

class Task {
  int id;
  String taskTitle;
  String taskDetails;
  int priorityId;
  int taskTypeId;
  int isRemind;
  int? isWaiting;
  DateTime? dueDate;
  dynamic startDate;
  int completionPercentage;
  int showCompletionPercentage;
  int projectId;
  int? projectPhaseId;
  dynamic prospectId;
  int createdBy;
  int statusId;
  int departmentId;
  DateTime createdAt;
  DateTime updatedAt;

  Task({
    required this.id,
    required this.taskTitle,
    required this.taskDetails,
    required this.priorityId,
    required this.taskTypeId,
    required this.isRemind,
    required this.isWaiting,
    required this.dueDate,
    required this.startDate,
    required this.completionPercentage,
    required this.showCompletionPercentage,
    required this.projectId,
    required this.projectPhaseId,
    required this.prospectId,
    required this.createdBy,
    required this.statusId,
    required this.departmentId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    taskTitle: json["task_title"],
    taskDetails: json["task_details"],
    priorityId: json["priority_id"],
    taskTypeId: json["task_type_id"],
    isRemind: json["is_remind"],
    isWaiting: json["is_waiting"],
    dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
    startDate: json["start_date"],
    completionPercentage: json["completion_percentage"],
    showCompletionPercentage: json["show_completion_percentage"],
    projectId: json["project_id"],
    projectPhaseId: json["project_phase_id"],
    prospectId: json["prospect_id"],
    createdBy: json["created_by"],
    statusId: json["status_id"],
    departmentId: json["department_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task_title": taskTitle,
    "task_details": taskDetails,
    "priority_id": priorityId,
    "task_type_id": taskTypeId,
    "is_remind": isRemind,
    "is_waiting": isWaiting,
    "due_date": dueDate?.toIso8601String(),
    "start_date": startDate,
    "completion_percentage": completionPercentage,
    "show_completion_percentage": showCompletionPercentage,
    "project_id": projectId,
    "project_phase_id": projectPhaseId,
    "prospect_id": prospectId,
    "created_by": createdBy,
    "status_id": statusId,
    "department_id": departmentId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
