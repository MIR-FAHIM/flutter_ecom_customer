import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ecom_user_flutter/app/api_providers/api_manager.dart';
import 'package:ecom_user_flutter/app/api_providers/api_url.dart';

import 'package:ecom_user_flutter/app/services/auth_service.dart';

class WishRepository {
  final userdata = GetStorage();

  getWishList(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(ApiClient.wishlist + id, {});

    print('getWishList 543: ${response}');

    return response;
  }

  deleteWish(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.deleteWithHeader(ApiClient.deleteWishlist + id, {});

    print('deleteWish 543: ${response}');

    return response;
  }
 addWish(data) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(ApiClient.addWishlist , data,  {});

    print('addWish 543: ${response}');

    return response;
  }

}
