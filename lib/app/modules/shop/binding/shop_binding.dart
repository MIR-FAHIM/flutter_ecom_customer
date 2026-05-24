import 'package:ecom_user_flutter/app/modules/banner/controller/banner_controller.dart';
import 'package:ecom_user_flutter/app/modules/shop/controller/shop_controller.dart';
import 'package:get/get.dart';


class ShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopController>(
          () => ShopController(),
    );
  }
}
