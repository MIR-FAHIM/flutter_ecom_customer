// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String? status;
  List<ProductDatum>? data;

  ProductModel({
     this.status,
     this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    status: json["status"],
    data: List<ProductDatum>.from(json["data"].map((x) => ProductDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ProductDatum {
  int id;
  String productName;
  String description;
  String image;
  int? brandId;
  int isActive;
  int? categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  int variantsCount;
  int totalStockQuantity;
  Category? category;
  List<Variant> variants;

  ProductDatum({
    required this.id,
    required this.productName,
    required this.description,
    required this.image,
    required this.brandId,
    required this.isActive,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.variantsCount,
    required this.totalStockQuantity,
    required this.category,
    required this.variants,
  });

  factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
    id: json["id"],
    productName: json["product_name"],
    description: json["description"],
    image: json["image"],
    brandId: json["brand_id"],
    isActive: json["is_active"],
    categoryId: json["category_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    variantsCount: json["variants_count"],
    totalStockQuantity: json["total_stock_quantity"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
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
    "variants_count": variantsCount,
    "total_stock_quantity": totalStockQuantity,
    "category": category?.toJson(),
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String categoryName;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.categoryName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    categoryName: json["category_name"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Variant {
  int id;
  int productId;
  String? type;
  String? model;
  String sku;
  String productCode;
  int quantityRequired;
  int stockId;
  bool isActive;
  String status;
  String discount;
  String price;
  String vat;
  String discountType;
  String? colorCode;
  String size;
  String unit;
  String weight;
  int entryBy;
  DateTime? discountStartDate;
  DateTime? discountEndDate;
  bool isRefundable;
  String? videoLink;
  String? imageLink;
  String? coverImage;
  String? externalLink;
  DateTime createdAt;
  DateTime updatedAt;

  Variant({
    required this.id,
    required this.productId,
    required this.type,
    required this.model,
    required this.sku,
    required this.productCode,
    required this.quantityRequired,
    required this.stockId,
    required this.isActive,
    required this.status,
    required this.discount,
    required this.price,
    required this.vat,
    required this.discountType,
    required this.colorCode,
    required this.size,
    required this.unit,
    required this.weight,
    required this.entryBy,
    required this.discountStartDate,
    required this.discountEndDate,
    required this.isRefundable,
    required this.videoLink,
    required this.imageLink,
    required this.coverImage,
    required this.externalLink,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    productId: json["product_id"],
    type: json["type"],
    model: json["model"],
    sku: json["sku"],
    productCode: json["product_code"],
    quantityRequired: json["quantity_required"],
    stockId: json["stock_id"],
    isActive: json["is_active"],
    status:json["status"],
    discount: json["discount"],
    price: json["price"],
    vat: json["vat"],
    discountType: json["discount_type"],
    colorCode: json["color_code"],
    size:json["size"],
    unit: json["unit"],
    weight: json["weight"],
    entryBy: json["entry_by"],
    discountStartDate: json["discount_start_date"] == null ? null : DateTime.parse(json["discount_start_date"]),
    discountEndDate: json["discount_end_date"] == null ? null : DateTime.parse(json["discount_end_date"]),
    isRefundable: json["is_refundable"],
    videoLink: json["video_link"],
    imageLink: json["image_link"],
    coverImage: json["cover_image"],
    externalLink: json["external_link"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "type": type,
    "model": model,
    "sku": sku,
    "product_code": productCode,
    "quantity_required": quantityRequired,
    "stock_id": stockId,
    "is_active": isActive,
    "status": status,
    "discount": discount,
    "price": price,
    "vat": vat,
    "discount_type": discountType,
    "color_code": colorCode,
    "size": size,
    "unit": unit,
    "weight": weight,
    "entry_by": entryBy,
    "discount_start_date": discountStartDate?.toIso8601String(),
    "discount_end_date": discountEndDate?.toIso8601String(),
    "is_refundable": isRefundable,
    "video_link": videoLink,
    "image_link": imageLink,
    "cover_image": coverImage,
    "external_link": externalLink,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}


