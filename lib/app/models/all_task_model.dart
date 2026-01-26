// To parse this JSON data, do
//
//     final allTaskModel = allTaskModelFromJson(jsonString);

import 'dart:convert';

AllTaskModel allTaskModelFromJson(String str) => AllTaskModel.fromJson(json.decode(str));

String allTaskModelToJson(AllTaskModel data) => json.encode(data.toJson());

class AllTaskModel {
  String? status;
  String? message;
  List<AllTaskDatum>? data;

  AllTaskModel({
     this.status,
     this.message,
     this.data,
  });

  factory AllTaskModel.fromJson(Map<String, dynamic> json) => AllTaskModel(
    status: json["status"],
    message: json["message"],
    data: List<AllTaskDatum>.from(json["data"].map((x) => AllTaskDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AllTaskDatum {
  int id;
  String taskTitle;
  String taskDetails;
  int priorityId;
  int taskTypeId;
  int isRemind;
  DateTime? dueDate;
  int completionPercentage;
  int showCompletionPercentage;
  int projectId;
  int? projectPhaseId;
  int? prospectId;
  int createdBy;
  int statusId;
  int departmentId;
  DateTime createdAt;
  DateTime updatedAt;
  Status taskType;
  Project? project;
  Priority priority;
  Creator creator;
  Status status;
  List<AssignedPerson> assignedPersons;

  AllTaskDatum({
    required this.id,
    required this.taskTitle,
    required this.taskDetails,
    required this.priorityId,
    required this.taskTypeId,
    required this.isRemind,
    required this.dueDate,
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
    required this.taskType,
    required this.project,
    required this.priority,
    required this.creator,
    required this.status,
    required this.assignedPersons,
  });

  factory AllTaskDatum.fromJson(Map<String, dynamic> json) => AllTaskDatum(
    id: json["id"],
    taskTitle: json["task_title"],
    taskDetails: json["task_details"]?? "No Details",
    priorityId: json["priority_id"],
    taskTypeId: json["task_type_id"],
    isRemind: json["is_remind"],
    dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
    completionPercentage: json["completion_percentage"] ?? 0,
    showCompletionPercentage: json["show_completion_percentage"],
    projectId: json["project_id"] ?? 0,
    projectPhaseId: json["project_phase_id"] ?? 0,
    prospectId: json["prospect_id"] ?? 0,
    createdBy: json["created_by"],
    statusId: json["status_id"],
    departmentId: json["department_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    taskType: Status.fromJson(json["task_type"]),
    project:json["project"] == null ? null: Project.fromJson(json["project"]),
    priority: Priority.fromJson(json["priority"]),
    creator: Creator.fromJson(json["creator"]),
    status: Status.fromJson(json["status"]),
    assignedPersons: List<AssignedPerson>.from(json["assigned_persons"].map((x) => AssignedPerson.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task_title": taskTitle,
    "task_details": taskDetails,
    "priority_id": priorityId,
    "task_type_id": taskTypeId,
    "is_remind": isRemind,
    "due_date": dueDate?.toIso8601String(),
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
    "task_type": taskType.toJson(),
    "project": project!.toJson(),
    "priority": priority.toJson(),
    "creator": creator.toJson(),
    "status": status.toJson(),
    "assigned_persons": List<dynamic>.from(assignedPersons.map((x) => x.toJson())),
  };
}

class AssignedPerson {
  int id;
  Creator assignedPerson;
  int assignedBy;
  int isMain;
  int taskId;
  DateTime createdAt;
  DateTime updatedAt;

  AssignedPerson({
    required this.id,
    required this.assignedPerson,
    required this.assignedBy,
    required this.isMain,
    required this.taskId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AssignedPerson.fromJson(Map<String, dynamic> json) => AssignedPerson(
    id: json["id"],
    assignedPerson: Creator.fromJson(json["assigned_person"]),
    assignedBy: json["assigned_by"],
    isMain: json["is_main"],
    taskId: json["task_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "assigned_person": assignedPerson.toJson(),
    "assigned_by": assignedBy,
    "is_main": isMain,
    "task_id": taskId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Creator {
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
  DateTime updatedAt;

  Creator({
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
    required this.fcmToken,
    required this.appToken,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    designationId: json["designation_id"],
    roleId: json["role_id"],
    departmentId: json["department_id"],
    birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
    isActive: json["isActive"],
    photo: json["photo"],
    bio:json["bio"] ?? "No Data",
    startHour: json["start_hour"],
    startMin: json["start_min"],
    fcmToken: json["fcm_token"] ?? "No Data",
    appToken: json["app_token"] ?? "No Data",
    emailVerifiedAt: json["email_verified_at"],
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
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}



class Priority {
  int id;
  String priorityName;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Priority({
    required this.id,
    required this.priorityName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Priority.fromJson(Map<String, dynamic> json) => Priority(
    id: json["id"],
    priorityName: json["priority_name"]!,
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



class Project {
  int id;
  String projectName;
  int departmentId;
  int isTech;
  int isMarketing;
  String description;
  int createdBy;
  DateTime createdAt;
  DateTime updatedAt;

  Project({
    required this.id,
    required this.projectName,
    required this.departmentId,
    required this.isTech,
    required this.isMarketing,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["id"],
    projectName: json["project_name"]!,
    departmentId: json["department_id"],
    isTech: json["is_tech"],
    isMarketing: json["is_marketing"],
    description: json["description"]!,
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_name": projectName,
    "department_id": departmentId,
    "is_tech": isTech,
    "is_marketing": isMarketing,
    "description": description,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}


class Status {
  int id;
  String? statusName;
  int departmentId;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String? typeName;

  Status({
    required this.id,
    this.statusName,
    required this.departmentId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.typeName,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    id: json["id"],
    statusName: json["status_name"],
    departmentId: json["department_id"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    typeName: json["type_name"] ?? "No Data",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status_name": statusName,
    "department_id": departmentId,
    "isActive": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "type_name": typeName,
  };
}

