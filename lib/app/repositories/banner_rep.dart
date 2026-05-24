import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ecom_user_flutter/app/api_providers/api_manager.dart';
import 'package:ecom_user_flutter/app/api_providers/api_url.dart';

import 'package:ecom_user_flutter/app/services/auth_service.dart';

class BannerRepository {
  final userdata = GetStorage();

  getBanner() async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(ApiClient.getBanner, {});

    print('getBanner 543: ${response}');

    return response;
  }

}
