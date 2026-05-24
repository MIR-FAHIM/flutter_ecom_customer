// lib/app/modules/home/controllers/banner_controller.dart
// Fix controller: null safe + loading + proper assignAll

import 'package:ecom_user_flutter/app/models/ecom/banner_model.dart';
import 'package:ecom_user_flutter/app/models/ecom/wish_model/wish_list_model.dart';
import 'package:ecom_user_flutter/app/repositories/banner_rep.dart';
import 'package:ecom_user_flutter/app/repositories/wish_rep.dart';
import 'package:ecom_user_flutter/app/services/auth_service.dart';
import 'package:ecom_user_flutter/common/ui.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  final wishProduct = <WishListItem>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getWishList();
  }

  Future<void> getWishList() async {

    isLoading.value = true;

    try {
      final e = await WishRepository().getWishList(Get.find<AuthService>().currentUser.value.data!.user!.id.toString());
      if (e is Map && e['status'] == 'success') {
        final model = WishListModel.fromJson(e as Map<String, dynamic>);
        wishProduct.assignAll(model.items); // model.data is List<BannerData>
      } else {
        wishProduct.clear();
      }
    } catch (_) {
      wishProduct.clear();
    } finally {
      isLoading.value = false;
    }
  }

Future<void> addWish(productId) async {

    Map data = {
      'user_id' : Get.find<AuthService>().currentUser.value.data!.user!.id.toString(),
      'product_id':productId.toString() ,
    };

    try {
      final e = await WishRepository().addWish(data);
      if (e is Map && e['status'] == 'success') {
        Get.showSnackbar(Ui.SuccessSnackBar(
            message: e['message'], title: 'Success'.tr));
      } else {

      }
    } catch (_) {

    } finally {

    }
  }

  Future<void> deleteWish(id) async {



    try {
      final e = await WishRepository().deleteWish(id);
      if (e is Map && e['status'] == 'success') {
        Get.showSnackbar(Ui.SuccessSnackBar(
            message: e['message'], title: 'Success'.tr));
      } else {

      }
    } catch (_) {

    } finally {

    }
  }
}



