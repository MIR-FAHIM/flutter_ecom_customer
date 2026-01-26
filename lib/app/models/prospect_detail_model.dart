// To parse this JSON data, do
//
//     final prospectDetailsModel = prospectDetailsModelFromJson(jsonString);

import 'dart:convert';

ProspectDetailsModel prospectDetailsModelFromJson(String str) =>
    ProspectDetailsModel.fromJson(json.decode(str));

String prospectDetailsModelToJson(ProspectDetailsModel data) =>
    json.encode(data.toJson());

class ProspectDetailsModel {
  String? status;
  DataProspectDetail? data;

  ProspectDetailsModel({
    this.status,
    this.data,
  });

  factory ProspectDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProspectDetailsModel(
        status: json["status"],
        data: DataProspectDetail.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
      };
}

class DataProspectDetail {
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
  String facebookPage;
  String linkedin;
  String type;
  int zoneId;
  double latitude;
  double longitude;
  String address;
  String note;
  DateTime? lastActivity;
  DateTime createdAt;
  DateTime updatedAt;
  ActivitySummary activitySummary;
  IndustryType informationSource;
  IndustryType industryType;
  Stage stage;
  Zone zone;
  InterestedFor? interestedFor;

  DataProspectDetail({
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
    this.isOpportunity,
    required this.websiteLink,
    required this.facebookPage,
    required this.linkedin,
    required this.type,
    required this.zoneId,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.note,
    this.lastActivity,
    required this.createdAt,
    required this.updatedAt,
    required this.activitySummary,
    required this.informationSource,
    required this.industryType,
    required this.stage,
    required this.zone,
     this.interestedFor,
  });

  factory DataProspectDetail.fromJson(Map<String, dynamic> json) =>
      DataProspectDetail(
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
        linkedin: json["linkedin"] ?? "No Linkedin",
        type: json["type"],
        zoneId: json["zone_id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        note: json["note"],
        lastActivity:json["last_activity"] == null ? null: DateTime.parse(json["last_activity"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        activitySummary: ActivitySummary.fromJson(json["activity_summary"]),
        informationSource: IndustryType.fromJson(json["information_source"]),
        industryType: IndustryType.fromJson(json["industry_type"]),
        stage: Stage.fromJson(json["stage"]),
        zone: Zone.fromJson(json["zone"]),
        interestedFor: json["interested_for"]  == null ? null  : InterestedFor.fromJson(json["interested_for"]),
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
        "last_activity": lastActivity!.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "activity_summary": activitySummary.toJson(),
        "information_source": informationSource.toJson(),
        "industry_type": industryType.toJson(),
        "stage": stage.toJson(),
        "zone": zone.toJson(),
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

  factory ActivitySummary.fromJson(Map<String, dynamic> json) =>
      ActivitySummary(
        general: json["general"],
        task: json["task"],
        call: json["call"],
        email: json["email"],
        whatsapp: json["whatsapp"],
        visit: json["visit"],
        message: json["message"],
        meeting: json["meeting"],
        stage:json["stage"],
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

class IndustryType {
  int id;
  String? industryTypeName;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String? informationSourceName;

  IndustryType({
    required this.id,
    this.industryTypeName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.informationSourceName,
  });

  factory IndustryType.fromJson(Map<String, dynamic> json) => IndustryType(
        id: json["id"],
        industryTypeName: json["industry_type_name"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        informationSourceName: json["information_source_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "industry_type_name": industryTypeName,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "information_source_name": informationSourceName,
      };
}

class InterestedFor {
  int id;
  String productName;
  String description;
  String image;
  dynamic brandId;
  int isActive;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;

  InterestedFor({
    required this.id,
    required this.productName,
    required this.description,
    required this.image,
    required this.brandId,
    required this.isActive,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InterestedFor.fromJson(Map<String, dynamic> json) => InterestedFor(
        id: json["id"],
        productName: json["product_name"],
        description: json["description"],
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
