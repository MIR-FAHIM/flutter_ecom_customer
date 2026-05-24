class WishListModel {
  final int count;
  final List<WishListItem> items;

  WishListModel({
    required this.count,
    required this.items,
  });

  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
      count: json['count'] ?? 0,
      items: (json['items'] as List<dynamic>? ?? [])
          .map((e) => WishListItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}
class WishListItem {
  final int id;
  final int userId;
  final int productId;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Product product;

  WishListItem({
    required this.id,
    required this.userId,
    required this.productId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory WishListItem.fromJson(Map<String, dynamic> json) {
    return WishListItem(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      status: json['status'] == true,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      product: Product.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'product_id': productId,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'product': product.toJson(),
    };
  }
}
class Product {
  final int id;
  final String name;
  final int unitPrice;
  final int currentStock;
  final String unit;
  final String description;
  final String slug;
  final PrimaryImage? primaryImage;
  final Shop shop;
  final Category category;
  final Category subcategory;

  Product({
    required this.id,
    required this.name,
    required this.unitPrice,
    required this.currentStock,
    required this.unit,
    required this.description,
    required this.slug,
    this.primaryImage,
    required this.shop,
    required this.category,
    required this.subcategory,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      unitPrice: json['unit_price'],
      currentStock: json['current_stock'],
      unit: json['unit'],
      description: json['description'],
      slug: json['slug'],
      primaryImage: json['primary_image'] != null
          ? PrimaryImage.fromJson(json['primary_image'])
          : null,
      shop: Shop.fromJson(json['shop']),
      category: Category.fromJson(json['category']),
      subcategory: Category.fromJson(json['subcategory']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'unit_price': unitPrice,
      'current_stock': currentStock,
      'unit': unit,
      'description': description,
      'slug': slug,
      'primary_image': primaryImage?.toJson(),
      'shop': shop.toJson(),
      'category': category.toJson(),
      'subcategory': subcategory.toJson(),
    };
  }
}
class PrimaryImage {
  final int id;
  final String fileName;
  final String extension;

  PrimaryImage({
    required this.id,
    required this.fileName,
    required this.extension,
  });

  factory PrimaryImage.fromJson(Map<String, dynamic> json) {
    return PrimaryImage(
      id: json['id'],
      fileName: json['file_name'],
      extension: json['extension'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'file_name': fileName,
      'extension': extension,
    };
  }
}
class Shop {
  final int id;
  final String name;
  final String email;
  final String phone;
  final int balance;

  Shop({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.balance,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      balance: json['balance'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'balance': balance,
    };
  }
}
class Category {
  final int id;
  final String name;
  final String slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
    };
  }
}
