import 'package:ecom_user_flutter/app/modules/banner/controller/banner_controller.dart';
import 'package:ecom_user_flutter/app/modules/wishlist/controller/wishlist_controller.dart';
import 'package:get/get.dart';


class WishlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(
          () => WishlistController(),
    );
  }
}
