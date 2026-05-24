// lib/app/models/order/order_history_model.dart

class OrderHistoryResModel {
  final String? status;
  final String? message;
  final OrderHistoryPage? data;

  OrderHistoryResModel({
    this.status,
    this.message,
    this.data,
  });

  factory OrderHistoryResModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryResModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? OrderHistoryPage.fromJson(json['data'])
          : null,
    );
  }
}
class OrderHistoryPage {
  final int? currentPage;
  final List<OrderHistoryItem>? items;
  final int? lastPage;
  final int? total;
  final int? perPage;
  final int? from;
  final int? to;
  final String? nextPageUrl;
  final String? prevPageUrl;

  OrderHistoryPage({
    this.currentPage,
    this.items,
    this.lastPage,
    this.total,
    this.perPage,
    this.from,
    this.to,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory OrderHistoryPage.fromJson(Map<String, dynamic> json) {
    return OrderHistoryPage(
      currentPage: json['current_page'] as int?,
      lastPage: json['last_page'] as int?,
      total: json['total'] as int?,
      perPage: json['per_page'] as int?,
      from: json['from'] as int?,
      to: json['to'] as int?,
      nextPageUrl: json['next_page_url'] as String?,
      prevPageUrl: json['prev_page_url'] as String?,
      items: (json['data'] as List<dynamic>?)
          ?.map((e) => OrderHistoryItem.fromJson(e))
          .toList(),
    );
  }
}
class OrderHistoryItem {
  final int? id;
  final int? userId;
  final String? orderNumber;
  final String? status;
  final String? paymentStatus;

  final String? customerName;
  final String? customerPhone;
  final String? shippingAddress;
  final String? zone;
  final String? district;
  final String? area;

  final double? subtotal;
  final double? shippingFee;
  final double? discount;
  final double? total;

  final String? note;
  final String? createdAt;
  final String? updatedAt;

  OrderHistoryItem({
    this.id,
    this.userId,
    this.orderNumber,
    this.status,
    this.paymentStatus,
    this.customerName,
    this.customerPhone,
    this.shippingAddress,
    this.zone,
    this.district,
    this.area,
    this.subtotal,
    this.shippingFee,
    this.discount,
    this.total,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderHistoryItem.fromJson(Map<String, dynamic> json) {
    return OrderHistoryItem(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      orderNumber: json['order_number'] as String?,
      status: json['status'] as String?,
      paymentStatus: json['payment_status'] as String?,
      customerName: json['customer_name'] as String?,
      customerPhone: json['customer_phone'] as String?,
      shippingAddress: json['shipping_address'] as String?,
      zone: json['zone'] as String?,
      district: json['district'] as String?,
      area: json['area'] as String?,
      subtotal: _toDouble(json['subtotal']),
      shippingFee: _toDouble(json['shipping_fee']),
      discount: _toDouble(json['discount']),
      total: _toDouble(json['total']),
      note: json['note'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
double? _toDouble(dynamic v) {
  if (v == null) return null;
  if (v is num) return v.toDouble();
  return double.tryParse(v.toString());
}
