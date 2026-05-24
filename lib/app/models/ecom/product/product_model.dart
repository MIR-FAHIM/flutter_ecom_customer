import 'dart:convert';

/// Top-level response wrapper
class ProductsResponse {
  final String status;
  final String message;
  final ProductsPage data;

  const ProductsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      status: (json['status'] ?? '') as String,
      message: (json['message'] ?? '') as String,
      data: ProductsPage.fromJson((json['data'] ?? const {}) as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };

  static ProductsResponse fromRawJson(String raw) =>
      ProductsResponse.fromJson(json.decode(raw) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());
}

/// Pagination container: data.current_page, data.data[], links, etc.
class ProductsPage {
  final int currentPage;
  final List<ProductModel> items;

  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<PageLink> links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  const ProductsPage({
    required this.currentPage,
    required this.items,
    required this.links,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory ProductsPage.fromJson(Map<String, dynamic> json) {
    final dataList = (json['data'] as List?) ?? const [];
    final linksList = (json['links'] as List?) ?? const [];

    return ProductsPage(
      currentPage: _asInt(json['current_page']),
      items: dataList
          .whereType<Map<String, dynamic>>()
          .map(ProductModel.fromJson)
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] == null ? null : _asInt(json['from']),
      lastPage: json['last_page'] == null ? null : _asInt(json['last_page']),
      lastPageUrl: json['last_page_url'] as String?,
      links: linksList
          .whereType<Map<String, dynamic>>()
          .map(PageLink.fromJson)
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] == null ? null : _asInt(json['per_page']),
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] == null ? null : _asInt(json['to']),
      total: json['total'] == null ? null : _asInt(json['total']),
    );
  }

  Map<String, dynamic> toJson() => {
    'current_page': currentPage,
    'data': items.map((e) => e.toJson()).toList(),
    'first_page_url': firstPageUrl,
    'from': from,
    'last_page': lastPage,
    'last_page_url': lastPageUrl,
    'links': links.map((e) => e.toJson()).toList(),
    'next_page_url': nextPageUrl,
    'path': path,
    'per_page': perPage,
    'prev_page_url': prevPageUrl,
    'to': to,
    'total': total,
  };
}

class ProductModel {
  final int id;
  final String name;
  final String? addedBy;
  final int? userId;
  final int? categoryId;
  final int? brandId;

  /// In your API these are strings like "2508"
  final String? photos;
  final String? thumbnailImg;

  final String? videoProvider;
  final String? videoLink;
  final String? tags;
  final String? description;

  final num unitPrice;
  final num? purchasePrice;

  final int variantProduct;

  /// API sends these as JSON strings "[]"
  final List<dynamic> attributes;
  final List<dynamic> choiceOptions;
  final List<dynamic> colors;

  final dynamic variations;

  final int todaysDeal;
  final int published;
  final int approved;

  final String? stockVisibilityState;
  final int cashOnDelivery;
  final int featured;
  final int sellerFeatured;

  final int currentStock;
  final String? unit;
  final num? weight;
  final int minQty;
  final int lowStockQuantity;

  final num discount;
  final String? discountType;
  final dynamic discountStartDate;
  final dynamic discountEndDate;

  final num startingBid;
  final dynamic auctionStartDate;
  final dynamic auctionEndDate;

  final dynamic tax;
  final dynamic taxType;

  final String? shippingType;
  final num shippingCost;
  final int isQuantityMultiplied;
  final dynamic estShippingDays;

  final int numOfSale;

  final String? metaTitle;
  final String? metaDescription;
  final String? metaImg;
  final dynamic pdf;
  final String? slug;

  final int refundable;
  final int earnPoint;
  final num rating;
  final String? barcode;

  final int digital;
  final int auctionProduct;

  final String? fileName;
  final String? filePath;
  final String? externalLink;
  final String? externalLinkBtn;

  final int wholesaleProduct;
  final String? frequentlyBroughtSelectionType;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  final UploadFile? primaryImage;
  final List<UploadFile> images;

  final ProductCategory? category;
  final ProductCategory? subCategory;

  final dynamic brand;
  final dynamic productDiscount;

  const ProductModel({
    required this.id,
    required this.name,
    required this.unitPrice,
    required this.variantProduct,
    required this.todaysDeal,
    required this.published,
    required this.approved,
    required this.cashOnDelivery,
    required this.featured,
    required this.sellerFeatured,
    required this.currentStock,
    required this.minQty,
    required this.lowStockQuantity,
    required this.discount,
    required this.shippingCost,
    required this.isQuantityMultiplied,
    required this.numOfSale,
    required this.refundable,
    required this.earnPoint,
    required this.rating,
    required this.digital,
    required this.auctionProduct,
    required this.wholesaleProduct,
    required this.attributes,
    required this.choiceOptions,
    required this.colors,
    required this.images,
    this.addedBy,
    this.userId,
    this.categoryId,
    this.brandId,
    this.photos,
    this.thumbnailImg,
    this.videoProvider,
    this.videoLink,
    this.tags,
    this.description,
    this.purchasePrice,
    this.variations,
    this.stockVisibilityState,
    this.unit,
    this.weight,
    this.discountType,
    this.discountStartDate,
    this.discountEndDate,
    this.startingBid = 0,
    this.auctionStartDate,
    this.auctionEndDate,
    this.tax,
    this.taxType,
    this.shippingType,
    this.estShippingDays,
    this.metaTitle,
    this.metaDescription,
    this.metaImg,
    this.pdf,
    this.slug,
    this.barcode,
    this.fileName,
    this.filePath,
    this.externalLink,
    this.externalLinkBtn,
    this.frequentlyBroughtSelectionType,
    this.createdAt,
    this.updatedAt,
    this.primaryImage,
    this.category,
    this.subCategory,
    this.brand,
    this.productDiscount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: _asInt(json['id']),
      name: (json['name'] ?? '') as String,
      addedBy: json['added_by'] as String?,
      userId: json['user_id'] == null ? null : _asInt(json['user_id']),
      categoryId: json['category_id'] == null ? null : _asInt(json['category_id']),
      brandId: json['brand_id'] == null ? null : _asInt(json['brand_id']),
      photos: json['photos']?.toString(),
      thumbnailImg: json['thumbnail_img']?.toString(),
      videoProvider: json['video_provider'] as String?,
      videoLink: json['video_link'] as String?,
      tags: json['tags'] as String?,
      description: json['description'] as String?,
      unitPrice: _asNum(json['unit_price']),
      purchasePrice: json['purchase_price'] == null ? null : _asNum(json['purchase_price']),
      variantProduct: _asInt(json['variant_product']),
      attributes: _decodeJsonListOrEmpty(json['attributes']),
      choiceOptions: _decodeJsonListOrEmpty(json['choice_options']),
      colors: _decodeJsonListOrEmpty(json['colors']),
      variations: json['variations'],
      todaysDeal: _asInt(json['todays_deal']),
      published: _asInt(json['published']),
      approved: _asInt(json['approved']),
      stockVisibilityState: json['stock_visibility_state'] as String?,
      cashOnDelivery: _asInt(json['cash_on_delivery']),
      featured: _asInt(json['featured']),
      sellerFeatured: _asInt(json['seller_featured']),
      currentStock: _asInt(json['current_stock']),
      unit: json['unit'] as String?,
      weight: json['weight'] == null ? null : _asNum(json['weight']),
      minQty: _asInt(json['min_qty']),
      lowStockQuantity: _asInt(json['low_stock_quantity']),
      discount: _asNum(json['discount']),
      discountType: json['discount_type'] as String?,
      discountStartDate: json['discount_start_date'],
      discountEndDate: json['discount_end_date'],
      startingBid: json['starting_bid'] == null ? 0 : _asNum(json['starting_bid']),
      auctionStartDate: json['auction_start_date'],
      auctionEndDate: json['auction_end_date'],
      tax: json['tax'],
      taxType: json['tax_type'],
      shippingType: json['shipping_type'] as String?,
      shippingCost: _asNum(json['shipping_cost']),
      isQuantityMultiplied: _asInt(json['is_quantity_multiplied']),
      estShippingDays: json['est_shipping_days'],
      numOfSale: _asInt(json['num_of_sale']),
      metaTitle: json['meta_title'] as String?,
      metaDescription: json['meta_description'] as String?,
      metaImg: json['meta_img']?.toString(),
      pdf: json['pdf'],
      slug: json['slug'] as String?,
      refundable: _asInt(json['refundable']),
      earnPoint: _asInt(json['earn_point']),
      rating: _asNum(json['rating']),
      barcode: json['barcode'] as String?,
      digital: _asInt(json['digital']),
      auctionProduct: _asInt(json['auction_product']),
      fileName: json['file_name'] as String?,
      filePath: json['file_path'] as String?,
      externalLink: json['external_link'] as String?,
      externalLinkBtn: json['external_link_btn'] as String?,
      wholesaleProduct: _asInt(json['wholesale_product']),
      frequentlyBroughtSelectionType: json['frequently_brought_selection_type'] as String?,
      createdAt: _tryParseDate(json['created_at']),
      updatedAt: _tryParseDate(json['updated_at']),
      primaryImage: json['primary_image'] is Map<String, dynamic>
          ? UploadFile.fromJson(json['primary_image'] as Map<String, dynamic>)
          : null,
      images: (json['images'] as List? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(UploadFile.fromJson)
          .toList(),
      category: json['category'] is Map<String, dynamic>
          ? ProductCategory.fromJson(json['category'] as Map<String, dynamic>)
          : null,
      subCategory: json['sub_category'] is Map<String, dynamic>
          ? ProductCategory.fromJson(json['sub_category'] as Map<String, dynamic>)
          : null,
      brand: json['brand'],
      productDiscount: json['product_discount'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'added_by': addedBy,
    'user_id': userId,
    'category_id': categoryId,
    'brand_id': brandId,
    'photos': photos,
    'thumbnail_img': thumbnailImg,
    'video_provider': videoProvider,
    'video_link': videoLink,
    'tags': tags,
    'description': description,
    'unit_price': unitPrice,
    'purchase_price': purchasePrice,
    'variant_product': variantProduct,
    'attributes': json.encode(attributes),
    'choice_options': json.encode(choiceOptions),
    'colors': json.encode(colors),
    'variations': variations,
    'todays_deal': todaysDeal,
    'published': published,
    'approved': approved,
    'stock_visibility_state': stockVisibilityState,
    'cash_on_delivery': cashOnDelivery,
    'featured': featured,
    'seller_featured': sellerFeatured,
    'current_stock': currentStock,
    'unit': unit,
    'weight': weight,
    'min_qty': minQty,
    'low_stock_quantity': lowStockQuantity,
    'discount': discount,
    'discount_type': discountType,
    'discount_start_date': discountStartDate,
    'discount_end_date': discountEndDate,
    'starting_bid': startingBid,
    'auction_start_date': auctionStartDate,
    'auction_end_date': auctionEndDate,
    'tax': tax,
    'tax_type': taxType,
    'shipping_type': shippingType,
    'shipping_cost': shippingCost,
    'is_quantity_multiplied': isQuantityMultiplied,
    'est_shipping_days': estShippingDays,
    'num_of_sale': numOfSale,
    'meta_title': metaTitle,
    'meta_description': metaDescription,
    'meta_img': metaImg,
    'pdf': pdf,
    'slug': slug,
    'refundable': refundable,
    'earn_point': earnPoint,
    'rating': rating,
    'barcode': barcode,
    'digital': digital,
    'auction_product': auctionProduct,
    'file_name': fileName,
    'file_path': filePath,
    'external_link': externalLink,
    'external_link_btn': externalLinkBtn,
    'wholesale_product': wholesaleProduct,
    'frequently_brought_selection_type': frequentlyBroughtSelectionType,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'primary_image': primaryImage?.toJson(),
    'images': images.map((e) => e.toJson()).toList(),
    'category': category?.toJson(),
    'sub_category': subCategory?.toJson(),
    'brand': brand,
    'product_discount': productDiscount,
  };
}

class UploadFile {
  final int id;
  final String? fileOriginalName;
  final String? fileName;
  final int? userId;
  final int? fileSize;
  final String? extension;
  final String? type;
  final String? externalLink;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? url;

  const UploadFile({
    required this.id,
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

  factory UploadFile.fromJson(Map<String, dynamic> json) {
    return UploadFile(
      id: _asInt(json['id']),
      fileOriginalName: json['file_original_name'] as String?,
      fileName: json['file_name'] as String?,
      userId: json['user_id'] == null ? null : _asInt(json['user_id']),
      fileSize: json['file_size'] == null ? null : _asInt(json['file_size']),
      extension: json['extension'] as String?,
      type: json['type'] as String?,
      externalLink: json['external_link'] as String?,
      createdAt: _tryParseDate(json['created_at']),
      updatedAt: _tryParseDate(json['updated_at']),
      deletedAt: _tryParseDate(json['deleted_at']),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'file_original_name': fileOriginalName,
    'file_name': fileName,
    'user_id': userId,
    'file_size': fileSize,
    'extension': extension,
    'type': type,
    'external_link': externalLink,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'deleted_at': deletedAt?.toIso8601String(),
    'url': url,
  };

  String? resolvedUrl({required String baseUrl}) {
    if (url != null && url!.trim().isNotEmpty) return url;
    if (fileName == null || fileName!.trim().isEmpty) return null;
    final b = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
    final f = fileName!.startsWith('/') ? fileName! : '/$fileName';
    return "$b$f";
  }
}

class ProductCategory {
  final int id;
  final int? parentId;
  final int? level;
  final String name;
  final int? orderLevel;
  final num? commisionRate;
  final dynamic banner;
  final dynamic icon;
  final dynamic coverImage;
  final int? featured;
  final int? top;
  final int? digital;
  final String? slug;
  final String? metaTitle;
  final String? metaDescription;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ProductCategory({
    required this.id,
    required this.name,
    this.parentId,
    this.level,
    this.orderLevel,
    this.commisionRate,
    this.banner,
    this.icon,
    this.coverImage,
    this.featured,
    this.top,
    this.digital,
    this.slug,
    this.metaTitle,
    this.metaDescription,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: _asInt(json['id']),
      parentId: json['parent_id'] == null ? null : _asInt(json['parent_id']),
      level: json['level'] == null ? null : _asInt(json['level']),
      name: (json['name'] ?? '') as String,
      orderLevel: json['order_level'] == null ? null : _asInt(json['order_level']),
      commisionRate: json['commision_rate'] == null ? null : _asNum(json['commision_rate']),
      banner: json['banner'],
      icon: json['icon'],
      coverImage: json['cover_image'],
      featured: json['featured'] == null ? null : _asInt(json['featured']),
      top: json['top'] == null ? null : _asInt(json['top']),
      digital: json['digital'] == null ? null : _asInt(json['digital']),
      slug: json['slug'] as String?,
      metaTitle: json['meta_title'] as String?,
      metaDescription: json['meta_description'] as String?,
      createdAt: _tryParseDate(json['created_at']),
      updatedAt: _tryParseDate(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'parent_id': parentId,
    'level': level,
    'name': name,
    'order_level': orderLevel,
    'commision_rate': commisionRate,
    'banner': banner,
    'icon': icon,
    'cover_image': coverImage,
    'featured': featured,
    'top': top,
    'digital': digital,
    'slug': slug,
    'meta_title': metaTitle,
    'meta_description': metaDescription,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}

class PageLink {
  final String? url;
  final String label;
  final bool active;

  const PageLink({
    required this.url,
    required this.label,
    required this.active,
  });

  factory PageLink.fromJson(Map<String, dynamic> json) {
    return PageLink(
      url: json['url'] as String?,
      label: (json['label'] ?? '') as String,
      active: (json['active'] ?? false) as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'url': url,
    'label': label,
    'active': active,
  };
}

/// ---------- helpers ----------

int _asInt(dynamic v) {
  if (v == null) return 0;
  if (v is int) return v;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v) ?? 0;
  return 0;
}

num _asNum(dynamic v) {
  if (v == null) return 0;
  if (v is num) return v;
  if (v is String) return num.tryParse(v) ?? 0;
  return 0;
}

DateTime? _tryParseDate(dynamic v) {
  if (v == null) return null;
  if (v is String && v.isNotEmpty) return DateTime.tryParse(v);
  return null;
}

/// Your API returns list fields like "attributes": "[]"
/// Sometimes it may become already-decoded List; we handle both.
List<dynamic> _decodeJsonListOrEmpty(dynamic v) {
  if (v == null) return <dynamic>[];
  if (v is List) return v;
  if (v is String) {
    final s = v.trim();
    if (s.isEmpty) return <dynamic>[];
    try {
      final decoded = json.decode(s);
      if (decoded is List) return decoded;
      return <dynamic>[];
    } catch (_) {
      return <dynamic>[];
    }
  }
  return <dynamic>[];
}
