// To parse this JSON data, do
//
//     final visitModel = visitModelFromJson(jsonString);

import 'dart:convert';

VisitModel visitModelFromJson(String str) => VisitModel.fromJson(json.decode(str));

String visitModelToJson(VisitModel data) => json.encode(data.toJson());

class VisitModel {
  String? status;
  String? message;
  List<DatumVisit>? data;

  VisitModel({
     this.status,
     this.message,
     this.data,
  });

  factory VisitModel.fromJson(Map<String, dynamic> json) => VisitModel(
    status: json["status"],
    message: json["message"],
    data: List<DatumVisit>.from(json["data"].map((x) => DatumVisit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumVisit {
  int id;
  String purpose;
  String note;
  Status? status;
  String visitType;
  DateTime scheduledAt;
  String? actualStartAt;
  String? actualEndAt;
  String? checkinLatitude;
  String? checkinLongitude;
  int employeeId;
  int plannerId;
  int leadId;
  int zoneId;
  int? priorityId;
  DateTime createdAt;
  DateTime updatedAt;
  Planner planner;
  Lead lead;
  Zone zone;
  TaskVisitRelation taskVisitRelation;
  Priority? priority;

  DatumVisit({
    required this.id,
    required this.purpose,
    required this.note,
     this.status,
    required this.visitType,
    required this.scheduledAt,
     this.actualStartAt,
     this.actualEndAt,
    required this.checkinLatitude,
    required this.checkinLongitude,
    required this.employeeId,
    required this.plannerId,
    required this.leadId,
    required this.zoneId,
    required this.priorityId,
    required this.createdAt,
    required this.updatedAt,
    required this.planner,
    required this.lead,
    required this.zone,
    required this.taskVisitRelation,
    required this.priority,
  });

  factory DatumVisit.fromJson(Map<String, dynamic> json) => DatumVisit(
    id: json["id"],
    purpose: json["purpose"],
    note: json["note"],
    status:json["status"] == null ? null : Status.fromJson(json["status"]),
    visitType: json["visit_type"],
    scheduledAt: DateTime.parse(json["scheduled_at"]),
    actualStartAt: json["actual_start_at"],
    actualEndAt: json["actual_end_at"],
    checkinLatitude: json["checkin_latitude"],
    checkinLongitude: json["checkin_longitude"],
    employeeId: json["employee_id"],
    plannerId: json["planner_id"],
    leadId: json["lead_id"],
    zoneId: json["zone_id"],
    priorityId: json["priority_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    planner: Planner.fromJson(json["planner"]),
    lead: Lead.fromJson(json["lead"]),
    zone: Zone.fromJson(json["zone"]),
    taskVisitRelation: TaskVisitRelation.fromJson(json["task_visit_relation"]),
    priority: json["priority"] == null ? null : Priority.fromJson(json["priority"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "purpose": purpose,
    "note": note,
    "status": status!.toJson(),
    "visit_type": visitType,
    "scheduled_at": scheduledAt.toIso8601String(),
    "actual_start_at": actualStartAt,
    "actual_end_at": actualEndAt,
    "checkin_latitude": checkinLatitude,
    "checkin_longitude": checkinLongitude,
    "employee_id": employeeId,
    "planner_id": plannerId,
    "lead_id": leadId,
    "zone_id": zoneId,
    "priority_id": priorityId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "planner": planner.toJson(),
    "lead": lead.toJson(),
    "zone": zone.toJson(),
    "task_visit_relation": taskVisitRelation.toJson(),
    "priority": priority?.toJson(),
  };
}

class Lead {
  int id;
  String prospectName;
  bool isIndividual;
  int industryTypeId;
  int interestedForId;
  int informationSourceId;
  int stageId;
  int priorityId;
  int status;
  int isActive;
  dynamic isOpportunity;
  String websiteLink;
  String facebookPage;
  String? linkedin;
  String type;
  int zoneId;
  double latitude;
  double longitude;
  String address;
  String note;
  DateTime lastActivity;
  DateTime createdAt;
  DateTime updatedAt;

  Lead({
    required this.id,
    required this.prospectName,
    required this.isIndividual,
    required this.industryTypeId,
    required this.interestedForId,
    required this.informationSourceId,
    required this.stageId,
    required this.priorityId,
    required this.status,
    required this.isActive,
    required this.isOpportunity,
    required this.websiteLink,
    required this.facebookPage,
    required this.linkedin,
    required this.type,
    required this.zoneId,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.note,
    required this.lastActivity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
    id: json["id"],
    prospectName: json["prospect_name"],
    isIndividual: json["is_individual"],
    industryTypeId: json["industry_type_id"],
    interestedForId: json["interested_for_id"],
    informationSourceId: json["information_source_id"],
    stageId: json["stage_id"],
    priorityId: json["priority_id"],
    status: json["status"],
    isActive: json["is_active"],
    isOpportunity: json["is_opportunity"],
    websiteLink: json["website_link"],
    facebookPage: json["facebook_page"],
    linkedin: json["linkedin"],
    type: json["type"],
    zoneId: json["zone_id"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    address: json["address"],
    note: json["note"],
    lastActivity: DateTime.parse(json["last_activity"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prospect_name": prospectName,
    "is_individual": isIndividual,
    "industry_type_id": industryTypeId,
    "interested_for_id": interestedForId,
    "information_source_id": informationSourceId,
    "stage_id": stageId,
    "priority_id": priorityId,
    "status": status,
    "is_active": isActive,
    "is_opportunity": isOpportunity,
    "website_link": websiteLink,
    "facebook_page": facebookPage,
    "linkedin": linkedin,
    "type": type,
    "zone_id": zoneId,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    "note": note,
    "last_activity": lastActivity.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Planner {
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
  String? fcmToken;
  String appToken;
  dynamic emailVerifiedAt;
  int startHour;
  int startMin;
  DateTime createdAt;
  DateTime updatedAt;

  Planner({
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
    required this.fcmToken,
    required this.appToken,
    required this.emailVerifiedAt,
    required this.startHour,
    required this.startMin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Planner.fromJson(Map<String, dynamic> json) => Planner(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    designationId: json["designation_id"],
    roleId: json["role_id"],
    departmentId: json["department_id"],
    birthdate: DateTime.parse(json["birthdate"]),
    isActive: json["isActive"],
    photo: json["photo"],
    bio: json["bio"],
    fcmToken: json["fcm_token"],
    appToken: json["app_token"],
    emailVerifiedAt: json["email_verified_at"],
    startHour: json["start_hour"],
    startMin: json["start_min"],
    createdAt: DateTime.parse(json["created_at"]),
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
    "fcm_token": fcmToken,
    "app_token": appToken,
    "email_verified_at": emailVerifiedAt,
    "start_hour": startHour,
    "start_min": startMin,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Priority {
  int id;
  String priorityName;
  int isActive;
  String colorCode;
  DateTime createdAt;
  DateTime updatedAt;

  Priority({
    required this.id,
    required this.priorityName,
    required this.isActive,
    required this.colorCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Priority.fromJson(Map<String, dynamic> json) => Priority(
    id: json["id"],
    priorityName: json["priority_name"],
    isActive: json["isActive"],
    colorCode: json["color_code"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "priority_name": priorityName,
    "isActive": isActive,
    "color_code": colorCode,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Status {
  int id;
  String statusName;
  int departmentId;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Status({
    required this.id,
    required this.statusName,
    required this.departmentId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class TaskVisitRelation {
  int id;
  int visitId;
  int taskId;
  dynamic note;
  dynamic latitude;
  dynamic longitude;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  TaskVisitRelation({
    required this.id,
    required this.visitId,
    required this.taskId,
    required this.note,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskVisitRelation.fromJson(Map<String, dynamic> json) => TaskVisitRelation(
    id: json["id"],
    visitId: json["visit_id"],
    taskId: json["task_id"],
    note: json["note"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "visit_id": visitId,
    "task_id": taskId,
    "note": note,
    "latitude": latitude,
    "longitude": longitude,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Zone {
  int id;
  String zoneName;
  dynamic districtId;
  dynamic divisionId;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Zone({
    required this.id,
    required this.zoneName,
    required this.districtId,
    required this.divisionId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
    id: json["id"],
    zoneName: json["zone_name"],
    districtId: json["district_id"],
    divisionId: json["division_id"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "zone_name": zoneName,
    "district_id": districtId,
    "division_id": divisionId,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
