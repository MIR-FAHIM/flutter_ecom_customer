// lib/app/modules/home/controllers/banner_controller.dart
// Fix controller: null safe + loading + proper assignAll

import 'package:ecom_user_flutter/app/models/ecom/banner_model.dart';
import 'package:ecom_user_flutter/app/repositories/banner_rep.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final bannerData = <BannerData>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getBanners();
  }

  Future<void> getBanners() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      final e = await BannerRepository().getBanner();
      if (e is Map && e['status'] == 'success') {
        final model = BannerResModel.fromJson(e as Map<String, dynamic>);
        bannerData.assignAll(model.data); // model.data is List<BannerData>
      } else {
        bannerData.clear();
      }
    } catch (_) {
      bannerData.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
