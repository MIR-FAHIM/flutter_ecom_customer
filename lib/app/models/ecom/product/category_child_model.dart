// To parse this JSON data, do
//
//     final categoryChildModel = categoryChildModelFromJson(jsonString);

import 'dart:convert';

CategoryChildModel categoryChildModelFromJson(String str) => CategoryChildModel.fromJson(json.decode(str));

String categoryChildModelToJson(CategoryChildModel data) => json.encode(data.toJson());

class CategoryChildModel {
  String? status;
  String? message;
  List<DatumCatChild>? data;

  CategoryChildModel({
     this.status,
     this.message,
     this.data,
  });

  factory CategoryChildModel.fromJson(Map<String, dynamic> json) => CategoryChildModel(
    status: json["status"],
    message: json["message"],
    data: List<DatumCatChild>.from(json["data"].map((x) => DatumCatChild.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumCatChild {
  int id;
  int parentId;
  int level;
  String name;
  int isActive;
  int orderLevel;
  int commisionRate;
  Banner? banner;
  String? icon;
  Banner? coverImage;
  int featured;
  int top;
  int digital;
  String slug;
  String? metaTitle;
  String? metaDescription;
  DateTime createdAt;
  DateTime updatedAt;

  DatumCatChild({
    required this.id,
    required this.parentId,
    required this.level,
    required this.name,
    required this.isActive,
    required this.orderLevel,
    required this.commisionRate,
    required this.banner,
    required this.icon,
    required this.coverImage,
    required this.featured,
    required this.top,
    required this.digital,
    required this.slug,
    required this.metaTitle,
    required this.metaDescription,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DatumCatChild.fromJson(Map<String, dynamic> json) => DatumCatChild(
    id: json["id"],
    parentId: json["parent_id"],
    level: json["level"],
    name: json["name"],
    isActive: json["is_active"],
    orderLevel: json["order_level"],
    commisionRate: json["commision_rate"],
    banner: json["banner"] == null ? null : Banner.fromJson(json["banner"]),
    icon: json["icon"],
    coverImage: json["cover_image"] == null ? null : Banner.fromJson(json["cover_image"]),
    featured: json["featured"],
    top: json["top"],
    digital: json["digital"],
    slug: json["slug"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "level": level,
    "name": name,
    "is_active": isActive,
    "order_level": orderLevel,
    "commision_rate": commisionRate,
    "banner": banner?.toJson(),
    "icon": icon,
    "cover_image": coverImage?.toJson(),
    "featured": featured,
    "top": top,
    "digital": digital,
    "slug": slug,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Banner {
  int id;
  String fileOriginalName;
  String fileName;
  int userId;
  int fileSize;
  String extension;
  String type;
  dynamic externalLink;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  dynamic url;

  Banner({
    required this.id,
    required this.fileOriginalName,
    required this.fileName,
    required this.userId,
    required this.fileSize,
    required this.extension,
    required this.type,
    required this.externalLink,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.url,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    fileOriginalName: json["file_original_name"],
    fileName: json["file_name"],
    userId: json["user_id"],
    fileSize: json["file_size"],
    extension: json["extension"],
    type: json["type"],
    externalLink: json["external_link"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "file_original_name": fileOriginalName,
    "file_name": fileName,
    "user_id": userId,
    "file_size": fileSize,
    "extension": extension,
    "type": type,
    "external_link": externalLink,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "url": url,
  };
}
