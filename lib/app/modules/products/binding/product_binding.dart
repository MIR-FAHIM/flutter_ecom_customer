import 'package:ecom_user_flutter/app/modules/banner/controller/banner_controller.dart';
import 'package:ecom_user_flutter/app/modules/category/controller/category_controller.dart';
import 'package:ecom_user_flutter/app/modules/products/controller/product_controller.dart';
import 'package:get/get.dart';


class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
          () => ProductController(),
    );
  }
}
