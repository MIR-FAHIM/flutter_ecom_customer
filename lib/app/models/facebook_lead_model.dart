// To parse this JSON data, do
//
//     final facebookLeadModel = facebookLeadModelFromJson(jsonString);

import 'dart:convert';

FacebookLeadModel facebookLeadModelFromJson(String str) => FacebookLeadModel.fromJson(json.decode(str));

String facebookLeadModelToJson(FacebookLeadModel data) => json.encode(data.toJson());

class FacebookLeadModel {
  String? status;
  String? message;
  Report? report;
  List<LeadFb>? data;

  FacebookLeadModel({
     this.status,
     this.message,
     this.report,
     this.data,
  });

  factory FacebookLeadModel.fromJson(Map<String, dynamic> json) => FacebookLeadModel(
    status: json["status"],
    message: json["message"],
    report: Report.fromJson(json["report"]),
    data: List<LeadFb>.from(json["data"].map((x) => LeadFb.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "report": report!.toJson(),
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class LeadFb {
  int id;
  String name;
  String email;
  String mobile;
  String note;
  String adName;
  String type;
  int productId;
  String? status;
  int? isCalled;
  int? isEmail;
  int? isWhatsapp;
  int? priorityId;
  DateTime createdAt;
  DateTime? updatedAt;
  Product? product;

  LeadFb({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.note,
    required this.adName,
    required this.type,
    required this.productId,
    required this.status,
    required this.isCalled,
    required this.isEmail,
    required this.isWhatsapp,
    required this.priorityId,
    required this.createdAt,
    required this.updatedAt,
     this.product,
  });

  factory LeadFb.fromJson(Map<String, dynamic> json) => LeadFb(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    note: json["note"],
    adName: json["ad_name"] ?? "No Ads Name",
    type: json["type"] ?? "No Type",
    productId: json["product_id"],
    status: json["status"],

    priorityId: json["priority_id"],
    isCalled: json["is_called"],
    isEmail: json["is_email"],
    isWhatsapp: json["is_whatsapp"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    product:json["product"] == null ? null : Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "note": note,
    "ad_name": adName,
    "type":type,
    "product_id": productId,
    "status": status,
    "priority_id": priorityId,
    "is_called": isCalled,
    "is_email": isEmail,
    "is_whatsapp": isWhatsapp,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "product": product!.toJson(),
  };
}



class Product {
  int id;
  String productName;
  String description;
  String image;
  int brandId;
  int isActive;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    "image":image,
    "brand_id": brandId,
    "is_active": isActive,
    "category_id": categoryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}



class Report {
  int? todayOnboard;
  int? yesterdayOnboard;
  int? last7DaysOnboard;
  int? last1MonthOnboard;
  int? last3MonthOnboard;
  int? last1YearOnboard;

  Report({
     this.todayOnboard,
     this.yesterdayOnboard,
     this.last7DaysOnboard,
     this.last1MonthOnboard,
     this.last3MonthOnboard,
     this.last1YearOnboard,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    todayOnboard: json["today_onboard"],
    yesterdayOnboard: json["yesterday_onboard"],
    last7DaysOnboard: json["last_7_days_onboard"],
    last1MonthOnboard: json["last_1_month_onboard"],
    last3MonthOnboard: json["last_3_month_onboard"],
    last1YearOnboard: json["last_1_year_onboard"],
  );

  Map<String, dynamic> toJson() => {
    "today_onboard": todayOnboard,
    "yesterday_onboard": yesterdayOnboard,
    "last_7_days_onboard": last7DaysOnboard,
    "last_1_month_onboard": last1MonthOnboard,
    "last_3_month_onboard": last3MonthOnboard,
    "last_1_year_onboard": last1YearOnboard,
  };
}

