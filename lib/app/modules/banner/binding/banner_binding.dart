import 'package:ecom_user_flutter/app/modules/banner/controller/banner_controller.dart';
import 'package:get/get.dart';


class BannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BannerController>(
          () => BannerController(),
    );
  }
}
