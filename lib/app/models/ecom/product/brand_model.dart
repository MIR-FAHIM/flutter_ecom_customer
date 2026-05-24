class BrandResModel {
  final String? status;
  final String? message;
  final BrandPageData? data;

  BrandResModel({this.status, this.message, this.data});

  factory BrandResModel.fromJson(Map<String, dynamic> json) {
    return BrandResModel(
      status: json['status']?.toString(),
      message: json['message']?.toString(),
      data: json['data'] == null ? null : BrandPageData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class BrandPageData {
  final int? currentPage;
  final List<BrandItem>? items;
  final int? from;
  final int? lastPage;
  final String? firstPageUrl;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? prevPageUrl;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  BrandPageData({
    this.currentPage,
    this.items,
    this.from,
    this.lastPage,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.prevPageUrl,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory BrandPageData.fromJson(Map<String, dynamic> json) {
    return BrandPageData(
      currentPage: _toInt(json['current_page']),
      items: (json['data'] as List?)
          ?.map((e) => BrandItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      from: _toInt(json['from']),
      lastPage: _toInt(json['last_page']),
      firstPageUrl: json['first_page_url']?.toString(),
      lastPageUrl: json['last_page_url']?.toString(),
      nextPageUrl: json['next_page_url']?.toString(),
      prevPageUrl: json['prev_page_url']?.toString(),
      path: json['path']?.toString(),
      perPage: _toInt(json['per_page']),
      to: _toInt(json['to']),
      total: _toInt(json['total']),
    );
  }

  static int? _toInt(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    return int.tryParse(v.toString());
  }
}

class BrandItem {
  final int? id;
  final String? name;
  final String? slug;
  final String? logo;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  BrandItem({
    this.id,
    this.name,
    this.slug,
    this.logo,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandItem.fromJson(Map<String, dynamic> json) {
    return BrandItem(
      id: BrandPageData._toInt(json['id']),
      name: json['name']?.toString(),
      slug: json['slug']?.toString(),
      logo: json['logo']?.toString(),
      status: json['status']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }

  bool get isActive {
    // backend sends "1" or "0" as string sometimes
    return status == '1' || status == 'active' || status == 'true';
  }
}
