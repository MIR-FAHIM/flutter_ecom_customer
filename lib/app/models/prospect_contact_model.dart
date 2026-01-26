// To parse this JSON data, do
//
//     final prospectContactPersonsModel = prospectContactPersonsModelFromJson(jsonString);

import 'dart:convert';

ProspectContactPersonsModel prospectContactPersonsModelFromJson(String str) => ProspectContactPersonsModel.fromJson(json.decode(str));

String prospectContactPersonsModelToJson(ProspectContactPersonsModel data) => json.encode(data.toJson());

class ProspectContactPersonsModel {
  String? status;
  List<DatumContact>? data;

  ProspectContactPersonsModel({
     this.status,
     this.data,
  });

  factory ProspectContactPersonsModel.fromJson(Map<String, dynamic> json) => ProspectContactPersonsModel(
    status: json["status"],
    data: List<DatumContact>.from(json["data"].map((x) => DatumContact.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumContact {
  int id;
  int prospectId;
  String personName;
  dynamic designationId;
  String mobile;
  String email;
  dynamic note;
  int isPrimary;
  int isResponsive;
  int attitudeId;
  int isKeyContact;
  dynamic influencingRoleId;
  dynamic birthDate;
  dynamic anniversary;
  dynamic isSwitchedJob;
  dynamic createdAt;
  dynamic updatedAt;

  DatumContact({
    required this.id,
    required this.prospectId,
    required this.personName,
    required this.designationId,
    required this.mobile,
    required this.email,
    required this.note,
    required this.isPrimary,
    required this.isResponsive,
    required this.attitudeId,
    required this.isKeyContact,
    required this.influencingRoleId,
    required this.birthDate,
    required this.anniversary,
    required this.isSwitchedJob,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DatumContact.fromJson(Map<String, dynamic> json) => DatumContact(
    id: json["id"],
    prospectId: json["prospect_id"],
    personName: json["person_name"],
    designationId: json["designation_id"],
    mobile: json["mobile"],
    email: json["email"],
    note: json["note"],
    isPrimary: json["is_primary"],
    isResponsive: json["is_responsive"],
    attitudeId: json["attitude_id"],
    isKeyContact: json["is_key_contact"],
    influencingRoleId: json["influencing_role_id"],
    birthDate: json["birth_date"],
    anniversary: json["anniversary"],
    isSwitchedJob: json["is_switched_job"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prospect_id": prospectId,
    "person_name": personName,
    "designation_id": designationId,
    "mobile": mobile,
    "email": email,
    "note": note,
    "is_primary": isPrimary,
    "is_responsive": isResponsive,
    "attitude_id": attitudeId,
    "is_key_contact": isKeyContact,
    "influencing_role_id": influencingRoleId,
    "birth_date": birthDate,
    "anniversary": anniversary,
    "is_switched_job": isSwitchedJob,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
