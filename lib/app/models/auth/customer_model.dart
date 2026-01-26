// To parse this JSON data, do
//
//     final userLoginResModel = userLoginResModelFromJson(jsonString);

import 'dart:convert';

UserLoginResModel userLoginResModelFromJson(String str) => UserLoginResModel.fromJson(json.decode(str));

String userLoginResModelToJson(UserLoginResModel data) => json.encode(data.toJson());

class UserLoginResModel {
  String? status;
  String? message;
  Data? data;

  UserLoginResModel({
     this.status,
     this.message,
     this.data,
  });

  factory UserLoginResModel.fromJson(Map<String, dynamic> json) => UserLoginResModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  String token;
  String tokenType;
  DateTime expiresAt;
  int tokenId;
  User user;

  Data({
    required this.token,
    required this.tokenType,
    required this.expiresAt,
    required this.tokenId,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    tokenType: json["token_type"],
    expiresAt: DateTime.parse(json["expires_at"]),
    tokenId: json["token_id"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "token_type": tokenType,
    "expires_at": expiresAt.toIso8601String(),
    "token_id": tokenId,
    "user": user.toJson(),
  };
}

class User {
  int id;
  dynamic referredBy;
  dynamic provider;
  dynamic providerId;
  String userType;
  String name;
  String email;
  DateTime emailVerifiedAt;
  dynamic deviceToken;
  dynamic avatar;
  dynamic avatarOriginal;
  String address;
  String country;
  String state;
  String city;
  dynamic postalCode;
  String phone;
  int balance;
  int banned;
  dynamic referralCode;
  dynamic customerPackageId;
  int remainingUploads;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.referredBy,
    required this.provider,
    required this.providerId,
    required this.userType,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.deviceToken,
    required this.avatar,
    required this.avatarOriginal,
    required this.address,
    required this.country,
    required this.state,
    required this.city,
    required this.postalCode,
    required this.phone,
    required this.balance,
    required this.banned,
    required this.referralCode,
    required this.customerPackageId,
    required this.remainingUploads,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    referredBy: json["referred_by"],
    provider: json["provider"],
    providerId: json["provider_id"],
    userType: json["user_type"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    deviceToken: json["device_token"],
    avatar: json["avatar"],
    avatarOriginal: json["avatar_original"],
    address: json["address"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    postalCode: json["postal_code"],
    phone: json["phone"],
    balance: json["balance"],
    banned: json["banned"],
    referralCode: json["referral_code"],
    customerPackageId: json["customer_package_id"],
    remainingUploads: json["remaining_uploads"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "referred_by": referredBy,
    "provider": provider,
    "provider_id": providerId,
    "user_type": userType,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
