// To parse this JSON data, do
//
// final bannerResModel = bannerResModelFromJson(jsonString);

import 'dart:convert';

BannerResModel bannerResModelFromJson(String str) =>
    BannerResModel.fromJson(json.decode(str) as Map<String, dynamic>);

String bannerResModelToJson(BannerResModel data) => json.encode(data.toJson());

class BannerResModel {
  final String? status;
  final String? message;
  final List<BannerData> data;

  const BannerResModel({
    this.status,
    this.message,
    required this.data,
  });

  factory BannerResModel.fromJson(Map<String, dynamic> json) => BannerResModel(
    status: json["status"] as String?,
    message: json["message"] as String?,
    data: (json["data"] is List)
        ? (json["data"] as List)
        .map((x) => BannerData.fromJson(x as Map<String, dynamic>))
        .toList()
        : <BannerData>[],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };
}

class BannerData {
  final int? id;
  final String? bannerName;
  final String? title;
  final int? relatedProductId;
  final int? relatedCategoryId;
  final dynamic imagePath;
  final String? imageId;
  final String? note;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final MediaImage? image;

  const BannerData({
    this.id,
    this.bannerName,
    this.title,
    this.relatedProductId,
    this.relatedCategoryId,
    this.imagePath,
    this.imageId,
    this.note,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
    id: _asInt(json["id"]),
    bannerName: json["banner_name"] as String?,
    title: json["title"] as String?,
    relatedProductId: _asInt(json["related_product_id"]),
    relatedCategoryId: _asInt(json["related_category_id"]),
    imagePath: json["image_path"],
    imageId: json["image_id"]?.toString(),
    note: json["note"] as String?,
    isActive: _asBool(json["is_active"]),
    createdAt: _asDate(json["created_at"]),
    updatedAt: _asDate(json["updated_at"]),
    image: json["image"] == null
        ? null
        : MediaImage.fromJson(json["image"] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "banner_name": bannerName,
    "title": title,
    "related_product_id": relatedProductId,
    "related_category_id": relatedCategoryId,
    "image_path": imagePath,
    "image_id": imageId,
    "note": note,
    "is_active": isActive,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "image": image?.toJson(),
  };
}

class MediaImage {
  final int? id;
  final String? fileOriginalName;
  final String? fileName;
  final int? userId;
  final int? fileSize;
  final String? extension;
  final String? type;
  final dynamic externalLink;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? url;

  const MediaImage({
    this.id,
    this.fileOriginalName,
    this.fileName,
    this.userId,
    this.fileSize,
    this.extension,
    this.type,
    this.externalLink,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.url,
  });

  factory MediaImage.fromJson(Map<String, dynamic> json) => MediaImage(
    id: _asInt(json["id"]),
    fileOriginalName: json["file_original_name"] as String?,
    fileName: json["file_name"] as String?,
    userId: _asInt(json["user_id"]),
    fileSize: _asInt(json["file_size"]),
    extension: json["extension"] as String?,
    type: json["type"] as String?,
    externalLink: json["external_link"],
    createdAt: _asDate(json["created_at"]),
    updatedAt: _asDate(json["updated_at"]),
    deletedAt: _asDate(json["deleted_at"]),
    url: json["url"] as String?,
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt?.toIso8601String(),
    "url": url,
  };

  /// Helper: build a usable image url if backend gives only file_name
  /// Example usage:
  /// final imgUrl = banner.image?.resolvedUrl(baseUrl: CompanyData.baseUrl);
  String? resolvedUrl({required String baseUrl}) {
    if (url != null && url!.trim().isNotEmpty) return url;
    if (fileName == null || fileName!.trim().isEmpty) return null;
    final b = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
    final f = fileName!.startsWith('/') ? fileName! : '/$fileName';
    return "$b$f";
  }
}

/// -------- Helpers (defensive parsing) --------

int? _asInt(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is double) return v.toInt();
  if (v is String) return int.tryParse(v);
  return null;
}

bool? _asBool(dynamic v) {
  if (v == null) return null;
  if (v is bool) return v;
  if (v is int) return v == 1;
  if (v is String) {
    final s = v.toLowerCase().trim();
    if (s == "true" || s == "1") return true;
    if (s == "false" || s == "0") return false;
  }
  return null;
}

DateTime? _asDate(dynamic v) {
  if (v == null) return null;
  if (v is DateTime) return v;
  if (v is String) return DateTime.tryParse(v);
  return null;
}
