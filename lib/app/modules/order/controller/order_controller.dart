// lib/app/modules/category/controller/category_controller.dart

import 'package:ecom_user_flutter/app/models/ecom/order/cart_model.dart';
import 'package:ecom_user_flutter/app/models/ecom/order/order_history_model.dart';
import 'package:ecom_user_flutter/app/models/ecom/order/user_address_model.dart';
import 'package:ecom_user_flutter/app/models/ecom/product/category_model.dart';
import 'package:ecom_user_flutter/app/repositories/order_rep.dart';


import 'package:get/get.dart';

class OrderController extends GetxController {
  final isLoading = false.obs;

  final error = ''.obs;
  final selectedAddress = ''.obs;
  final totalAmount = 0.0.obs;
  final orderHistory = <OrderHistoryItem>[].obs;
  @override
  void onInit() {
    userOrderHistoryController();
    super.onInit();

  }
  Future<void> userOrderHistoryController() async {

    print('i am userOrderHistoryController');


    isLoading.value = true;
    error.value = '';

    try {
      final res = await OrderRepository().getUserOrderList();
      // Debug
      // print('Category API res = $res');

      if (res is Map && res['status'] == 'success') {
        final model = OrderHistoryResModel.fromJson(res as Map<String, dynamic>);
        orderHistory.value = model.data!.items!;
        print('i am here3456523');
      } else {
        error.value =
        (res is Map ? (res['message']?.toString() ?? 'Failed') : 'Failed');
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

}
