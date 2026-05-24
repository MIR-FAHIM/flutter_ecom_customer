// lib/app/models/cart/cart_model.dart

class CartResModel {
  final String? status;
  final String? message;
  final CartModel? data;

  CartResModel({this.status, this.message, this.data});

  factory CartResModel.fromJson(Map<String, dynamic> json) {
    return CartResModel(
      status: json['status']?.toString(),
      message: json['message']?.toString(),
      data: json['data'] == null ? null : CartModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };
}

class CartModel {
  final int? id;
  final int? userId;
  final String? status;
  final int? totalItems;
  final num? subtotal;
  final String? createdAt;
  final String? updatedAt;
  final List<CartItem>? items;

  CartModel({
    this.id,
    this.userId,
    this.status,
    this.totalItems,
    this.subtotal,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: _asInt(json['id']),
      userId: _asInt(json['user_id']),
      status: json['status']?.toString(),
      totalItems: _asInt(json['total_items']),
      subtotal: _asNum(json['subtotal']),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      items: (json['items'] as List?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
          const <CartItem>[],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'status': status,
    'total_items': totalItems,
    'subtotal': subtotal,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'items': items?.map((e) => e.toJson()).toList(),
  };

  // Handy computed helpers
  bool get hasItems => (items?.isNotEmpty ?? false);

  num get computedSubtotal {
    final list = items ?? const <CartItem>[];
    num sum = 0;
    for (final it in list) {
      sum += (it.lineTotal ?? 0);
    }
    return sum;
  }
}

class CartItem {
  final int? id;
  final int? cartId;
  final int? productId;
  final int? shopId;
  final int? attributeId;
  final int? qty;
  final num? unitPrice;
  final num? lineTotal;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  final CartProduct? product;
  final CartShop? shop;
  final CartProductAttribute? productAttribute;

  CartItem({
    this.id,
    this.cartId,
    this.productId,
    this.shopId,
    this.attributeId,
    this.qty,
    this.unitPrice,
    this.lineTotal,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.product,
    this.shop,
    this.productAttribute,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: _asInt(json['id']),
      cartId: _asInt(json['cart_id']),
      productId: _asInt(json['product_id']),
      shopId: _asInt(json['shop_id']),
      attributeId: _asInt(json['attribute_id']),
      qty: _asInt(json['qty']),
      unitPrice: _asNum(json['unit_price']),
      lineTotal: _asNum(json['line_total']),
      status: json['status']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      product: json['product'] == null
          ? null
          : CartProduct.fromJson(json['product'] as Map<String, dynamic>),
      shop: json['shop'] == null ? null : CartShop.fromJson(json['shop'] as Map<String, dynamic>),
      productAttribute: json['product_attribute'] == null
          ? null
          : CartProductAttribute.fromJson(json['product_attribute'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'cart_id': cartId,
    'product_id': productId,
    'shop_id': shopId,
    'attribute_id': attributeId,
    'qty': qty,
    'unit_price': unitPrice,
    'line_total': lineTotal,
    'status': status,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'product': product?.toJson(),
    'shop': shop?.toJson(),
    'product_attribute': productAttribute?.toJson(),
  };
}

/// Minimal product snapshot used inside CartItem.product
/// Keep this separate from your big ProductDetail model to avoid heavy coupling.
class CartProduct {
  final int? id;
  final String? name;
  final String? thumbnailImg;
  final num? unitPrice;
  final int? currentStock;
  final String? unit;
  final num? discount;
  final String? discountType;

  final CartImage? primaryImage;

  CartProduct({
    this.id,
    this.name,
    this.thumbnailImg,
    this.unitPrice,
    this.currentStock,
    this.unit,
    this.discount,
    this.discountType,
    this.primaryImage,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: _asInt(json['id']),
      name: json['name']?.toString(),
      thumbnailImg: json['thumbnail_img']?.toString(),
      unitPrice: _asNum(json['unit_price']),
      currentStock: _asInt(json['current_stock']),
      unit: json['unit']?.toString(),
      discount: _asNum(json['discount']),
      discountType: json['discount_type']?.toString(),
      primaryImage: json['primary_image'] == null
          ? null
          : CartImage.fromJson(json['primary_image'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'thumbnail_img': thumbnailImg,
    'unit_price': unitPrice,
    'current_stock': currentStock,
    'unit': unit,
    'discount': discount,
    'discount_type': discountType,
    'primary_image': primaryImage?.toJson(),
  };
}

class CartImage {
  final int? id;
  final String? fileName;
  final String? extension;
  final String? type;
  final String? url;

  CartImage({
    this.id,
    this.fileName,
    this.extension,
    this.type,
    this.url,
  });

  factory CartImage.fromJson(Map<String, dynamic> json) {
    return CartImage(
      id: _asInt(json['id']),
      fileName: json['file_name']?.toString(),
      extension: json['extension']?.toString(),
      type: json['type']?.toString(),
      url: json['url']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'file_name': fileName,
    'extension': extension,
    'type': type,
    'url': url,
  };
}

class CartShop {
  final int? id;
  final String? name;

  CartShop({this.id, this.name});

  factory CartShop.fromJson(Map<String, dynamic> json) {
    return CartShop(
      id: _asInt(json['id']),
      name: json['name']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}

class CartProductAttribute {
  final int? id;
  final int? productId;
  final int? attributeId;
  final String? value;

  CartProductAttribute({this.id, this.productId, this.attributeId, this.value});

  factory CartProductAttribute.fromJson(Map<String, dynamic> json) {
    return CartProductAttribute(
      id: _asInt(json['id']),
      productId: _asInt(json['product_id']),
      attributeId: _asInt(json['attribute_id']),
      value: json['value']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'product_id': productId,
    'attribute_id': attributeId,
    'value': value,
  };
}

// --------- safe parsers (avoid runtime crashes) ---------

int? _asInt(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is num) return v.toInt();
  return int.tryParse(v.toString());
}

num? _asNum(dynamic v) {
  if (v == null) return null;
  if (v is num) return v;
  return num.tryParse(v.toString());
}
