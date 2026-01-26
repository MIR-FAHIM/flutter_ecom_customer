// To parse this JSON data, do
//
//     final allProspectModel = allProspectModelFromJson(jsonString);

import 'dart:convert';

AllProspectModel allProspectModelFromJson(String str) => AllProspectModel.fromJson(json.decode(str));

String allProspectModelToJson(AllProspectModel data) => json.encode(data.toJson());

class AllProspectModel {
  String? status;
  List<DatumAllProspect>? data;

  AllProspectModel({
     this.status,
     this.data,
  });

  factory AllProspectModel.fromJson(Map<String, dynamic> json) => AllProspectModel(
    status: json["status"],
    data: List<DatumAllProspect>.from(json["data"].map((x) => DatumAllProspect.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumAllProspect {
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
  int? isOpportunity;
  String websiteLink;
  String? facebookPage;
  String? linkedin;
  String? type;
  int zoneId;
  double latitude;
  double longitude;
  String address;
  String note;
  DateTime? lastActivity;
  DateTime createdAt;
  DateTime updatedAt;
  ActivitySummary activitySummary;
  Stage stage;
  IndustryType industryType;
  List<ConcernPerson> concernPersons;
  IndustryType informationSource;
  Zone? zone;
  InterestedFor? interestedFor;

  DatumAllProspect({
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
    required this.activitySummary,
    required this.stage,
    required this.industryType,
    required this.concernPersons,
    required this.informationSource,
    required this.zone,
     this.interestedFor,
  });

  factory DatumAllProspect.fromJson(Map<String, dynamic> json) => DatumAllProspect(
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
    websiteLink: json["website_link"] ?? "No Website",
    facebookPage: json["facebook_page"],
    linkedin: json["linkedin"],
    type:json["type"],
    zoneId: json["zone_id"],
    latitude: json["latitude"] == null ? 0.00 :json["latitude"].toDouble(),
    longitude: json["longitude"] == null ? 0.00 : json["longitude"].toDouble(),
    address: json["address"],
    note: json["note"],
    lastActivity: json["last_activity"] == null ? null : DateTime.parse(json["last_activity"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    activitySummary: ActivitySummary.fromJson(json["activity_summary"]),
    stage: Stage.fromJson(json["stage"]),
    industryType: IndustryType.fromJson(json["industry_type"]),
    concernPersons: List<ConcernPerson>.from(json["concern_persons"].map((x) => ConcernPerson.fromJson(x))),
    informationSource: IndustryType.fromJson(json["information_source"]),
    zone: json["zone"] == null ? null : Zone.fromJson(json["zone"]),
    interestedFor:json["interested_for"] ==  null ? null :InterestedFor.fromJson(json["interested_for"]),
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
    "last_activity": lastActivity?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "activity_summary": activitySummary.toJson(),
    "stage": stage.toJson(),
    "industry_type": industryType.toJson(),
    "concern_persons": List<dynamic>.from(concernPersons.map((x) => x.toJson())),
    "information_source": informationSource.toJson(),
    "zone": zone?.toJson(),
    "interested_for": interestedFor!.toJson(),
  };
}

class ActivitySummary {
  int general;
  int task;
  int call;
  int email;
  int whatsapp;
  int visit;
  int message;
  int meeting;
  int? stage;

  ActivitySummary({
    required this.general,
    required this.task,
    required this.call,
    required this.email,
    required this.whatsapp,
    required this.visit,
    required this.message,
    required this.meeting,
    this.stage,
  });

  factory ActivitySummary.fromJson(Map<String, dynamic> json) => ActivitySummary(
    general: json["general"],
    task: json["task"],
    call: json["call"],
    email: json["email"],
    whatsapp: json["whatsapp"],
    visit: json["visit"],
    message: json["message"],
    meeting: json["meeting"],
    stage: json["stage"],
  );

  Map<String, dynamic> toJson() => {
    "general": general,
    "task": task,
    "call": call,
    "email": email,
    "whatsapp": whatsapp,
    "visit": visit,
    "message": message,
    "meeting": meeting,
    "stage": stage,
  };
}

class ConcernPerson {
  int id;
  int prospectId;
  String personName;
  int? designationId;
  String mobile;
  String email;
  dynamic note;
  int isPrimary;
  int isResponsive;
  int attitudeId;
  int isKeyContact;
  int? influencingRoleId;
  DateTime? birthDate;
  DateTime? anniversary;
  int? isSwitchedJob;
  dynamic createdAt;
  dynamic updatedAt;

  ConcernPerson({
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

  factory ConcernPerson.fromJson(Map<String, dynamic> json) => ConcernPerson(
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
    birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
    anniversary: json["anniversary"] == null ? null : DateTime.parse(json["anniversary"]),
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
    "birth_date": birthDate?.toIso8601String(),
    "anniversary": anniversary?.toIso8601String(),
    "is_switched_job": isSwitchedJob,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class IndustryType {
  int id;
  String? industryTypeName;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;


  IndustryType({
    required this.id,
    this.industryTypeName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,

  });

  factory IndustryType.fromJson(Map<String, dynamic> json) => IndustryType(
    id: json["id"],
    industryTypeName: json["industry_type_name"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "industry_type_name": industryTypeName,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),

  };
}



class InterestedFor {
  int? id;
  String? productName;
  String? description;
  String? image;
  int? brandId;
  int? isActive;
  int? categoryId;
  DateTime? createdAt;
  DateTime? updatedAt;

  InterestedFor({
     this.id,
     this.productName,
     this.description,
     this.image,
     this.brandId,
     this.isActive,
     this.categoryId,
     this.createdAt,
     this.updatedAt,
  });

  factory InterestedFor.fromJson(Map<String, dynamic> json) => InterestedFor(
    id: json["id"],
    productName: json["product_name"]!,
    description: json["description"]!,
    image: json["image"],
    brandId: json["brand_id"],
    isActive: json["is_active"],
    categoryId: json["category_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "description": description,
    "image": image,
    "brand_id": brandId,
    "is_active": isActive,
    "category_id": categoryId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}




class Stage {
  int id;
  String stageName;
  bool isActive;
  String colorCode;
  DateTime createdAt;
  DateTime updatedAt;

  Stage({
    required this.id,
    required this.stageName,
    required this.isActive,
    required this.colorCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Stage.fromJson(Map<String, dynamic> json) => Stage(
    id: json["id"],
    stageName: json["stage_name"],
    isActive: json["is_active"],
    colorCode: json["color_code"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "stage_name": stageName,
    "is_active": isActive,
    "color_code": colorCode,
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
    zoneName:json["zone_name"],
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


