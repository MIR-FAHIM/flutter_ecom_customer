import 'package:ecom_user_flutter/app/modules/banner/controller/banner_controller.dart';
import 'package:ecom_user_flutter/app/modules/category/controller/category_controller.dart';
import 'package:ecom_user_flutter/app/modules/order/controller/order_controller.dart';
import 'package:get/get.dart';


class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
          () => OrderController(),
    );
  }
}
