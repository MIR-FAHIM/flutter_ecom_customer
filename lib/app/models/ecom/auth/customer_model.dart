// To parse this JSON data, do
//
// final userLoginResModel = userLoginResModelFromJson(jsonString);

import 'dart:convert';

UserLoginResModel userLoginResModelFromJson(String str) =>
    UserLoginResModel.fromJson(json.decode(str) as Map<String, dynamic>);

String userLoginResModelToJson(UserLoginResModel data) =>
    json.encode(data.toJson());

class UserLoginResModel {
  final String? status;
  final String? message;
  final LoginData? data;

  const UserLoginResModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserLoginResModel.fromJson(Map<String, dynamic> json) =>
      UserLoginResModel(
        status: json["status"] as String?,
        message: json["message"] as String?,
        data: json["data"] == null
            ? null
            : LoginData.fromJson(json["data"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class LoginData {
  final String? token;
  final String? tokenType;
  final DateTime? expiresAt;
  final int? tokenId;
  final User? user;

  const LoginData({
    this.token,
    this.tokenType,
    this.expiresAt,
    this.tokenId,
    this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    token: json["token"] as String?,
    tokenType: json["token_type"] as String?,
    expiresAt: _asDate(json["expires_at"]),
    tokenId: _asInt(json["token_id"]),
    user: json["user"] == null
        ? null
        : User.fromJson(json["user"] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "token_type": tokenType,
    "expires_at": expiresAt?.toIso8601String(),
    "token_id": tokenId,
    "user": user?.toJson(),
  };
}

class User {
  final int? id;
  final dynamic referredBy;
  final dynamic provider;
  final dynamic providerId;
  final String? userType;
  final String? name;
  final String? email;
  final DateTime? emailVerifiedAt;
  final dynamic deviceToken;
  final dynamic avatar;
  final dynamic avatarOriginal;
  final String? address;
  final String? country;
  final String? state;
  final String? city;
  final dynamic postalCode;
  final String? phone;
  final int? balance;
  final int? banned;
  final dynamic referralCode;
  final dynamic customerPackageId;
  final int? remainingUploads;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const User({
    this.id,
    this.referredBy,
    this.provider,
    this.providerId,
    this.userType,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.deviceToken,
    this.avatar,
    this.avatarOriginal,
    this.address,
    this.country,
    this.state,
    this.city,
    this.postalCode,
    this.phone,
    this.balance,
    this.banned,
    this.referralCode,
    this.customerPackageId,
    this.remainingUploads,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: _asInt(json["id"]),
    referredBy: json["referred_by"],
    provider: json["provider"],
    providerId: json["provider_id"],
    userType: json["user_type"] as String?,
    name: json["name"] as String?,
    email: json["email"] as String?,
    emailVerifiedAt: _asDate(json["email_verified_at"]),
    deviceToken: json["device_token"],
    avatar: json["avatar"],
    avatarOriginal: json["avatar_original"],
    address: json["address"] as String?,
    country: json["country"] as String?,
    state: json["state"] as String?,
    city: json["city"] as String?,
    postalCode: json["postal_code"],
    phone: json["phone"] as String?,
    balance: _asInt(json["balance"]),
    banned: _asInt(json["banned"]),
    referralCode: json["referral_code"],
    customerPackageId: json["customer_package_id"],
    remainingUploads: _asInt(json["remaining_uploads"]),
    createdAt: _asDate(json["created_at"]),
    updatedAt: _asDate(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "referred_by": referredBy,
    "provider": provider,
    "provider_id": providerId,
    "user_type": userType,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "device_token": deviceToken,
    "avatar": avatar,
    "avatar_original": avatarOriginal,
    "address": address,
    "country": country,
    "state": state,
    "city": city,
    "postal_code": postalCode,
    "phone": phone,
    "balance": balance,
    "banned": banned,
    "referral_code": referralCode,
    "customer_package_id": customerPackageId,
    "remaining_uploads": remainingUploads,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

/// ---------- Helpers (defensive parsing) ----------

int? _asInt(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is double) return v.toInt();
  if (v is String) return int.tryParse(v);
  return null;
}

DateTime? _asDate(dynamic v) {
  if (v == null) return null;
  if (v is DateTime) return v;
  if (v is String) return DateTime.tryParse(v);
  return null;
}
