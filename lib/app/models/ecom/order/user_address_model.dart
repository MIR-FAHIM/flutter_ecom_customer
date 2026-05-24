// lib/app/models/address/address_response.dart


class AddressResponse {
  final String? status;
  final String? message;
  final List<AddressModel> data;

  AddressResponse({
    this.status,
    this.message,
    required this.data,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
          <AddressModel>[],
    );
  }
}
// lib/app/models/address/address_model.dart

class AddressModel {
  final int id;
  final String name;
  final int userId;
  final String mobile;
  final String address;
  final String? district;
  final String? area;
  final String? house;
  final String? flat;
  final double? lat;
  final double? lon;
  final String? note;
  final bool status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AddressModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.mobile,
    required this.address,
    this.district,
    this.area,
    this.house,
    this.flat,
    this.lat,
    this.lon,
    this.note,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? '',
      userId: json['user_id'] ?? 0,
      mobile: json['mobile']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      district: json['district']?.toString(),
      area: json['area']?.toString(),
      house: json['house']?.toString(),
      flat: json['flat']?.toString(),
      lat: json['lat'] != null ? double.tryParse(json['lat'].toString()) : null,
      lon: json['lon'] != null ? double.tryParse(json['lon'].toString()) : null,
      note: json['note']?.toString(),
      status: json['status'] == true,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }
}
