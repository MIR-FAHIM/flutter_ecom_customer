import 'package:ecom_user_flutter/app/api_providers/company_data.dart';
import 'package:ecom_user_flutter/app/models/ecom/banner_model.dart';
import 'package:ecom_user_flutter/app/modules/banner/controller/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListView extends GetView<BannerController> {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final loading = controller.isLoading.value;
      final banners = controller.bannerData;



      return Scaffold();
    });
  }
}