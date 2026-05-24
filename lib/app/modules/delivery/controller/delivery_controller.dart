
import 'package:ecom_user_flutter/app/models/ecom/delivery/delivery_model.dart';
import 'package:ecom_user_flutter/app/models/ecom/delivery/delivery_report.dart';
import 'package:ecom_user_flutter/app/models/ecom/delivery/order_detail.dart';
import 'package:ecom_user_flutter/app/models/ecom/profile_model.dart';

import 'package:ecom_user_flutter/app/repositories/auth_repositories.dart';
import 'package:ecom_user_flutter/app/repositories/delivery_rep.dart';
import 'package:ecom_user_flutter/app/repositories/order_rep.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ecom_user_flutter/app/modules/settings/controllers/language_controller.dart';

import 'package:ecom_user_flutter/app/routes/app_pages.dart';
import 'package:ecom_user_flutter/app/services/auth_service.dart';
import 'package:ecom_user_flutter/common/ui.dart';
import 'package:ecom_user_flutter/main.dart';
import 'package:ecom_user_flutter/service/shared_pref.dart';

class DeliveryController extends GetxController {
  //TODO: Implement HomeController

  final balance = '0.0'.obs;
  final phoneController = TextEditingController().obs;
  final outletNameController = TextEditingController().obs;
  final ownerController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final status = false.obs;

  final isLoadingAssigned = false.obs;
  final isLoadingDetail = false.obs;
  final packageLoad = false.obs;
  final orderStatus = ['picked' , 'on the way' , 'delivered'].obs;

  final userID = 0.obs;
  final orderId = 0.obs;

  final box = GetStorage().obs;

  final deliveryOrder = <DatumDeOrder>[].obs;
  final completedAllDelivery = <DatumDeOrder>[].obs;
  final deliveredDelivery = <DatumDeOrder>[].obs;
  final orderDetails = OrderDetailsModel().obs;
  final deliveryReport = DeliveryReportModel().obs;

  @override
  Future<void> onInit() async {
    userID.value = Get.find<AuthService>().currentUser.value.data!.user!.id!;

    assignedDelivery();
    completedAllDeliveryController();
    deliveredDeliveryController();
    super.onInit();
    print('HomeController.onInit');
  }

  Future refreshHome() async {}

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }
  String nextStatus(String current) {
    if (current.isEmpty) return '';

    final index = orderStatus.indexWhere(
          (e) => e.toLowerCase() == current.toLowerCase(),
    );

    // not found or already last state
    if (index == -1 || index >= orderStatus.length - 1) {
      return '';
    }

    return orderStatus[index + 1];
  }


  assignedDelivery() {
    DeliveryRepository().assignedDelivery(userID.value.toString()).then((e) {
      print("DeliveryModel data is $e");
      isLoadingAssigned.value = true;
      try {
        if (e['status'] == 'success') {
          DeliveryModel model = DeliveryModel.fromJson(e);
          deliveryOrder.value = model.data!.data;
        }
      } catch (err) {
        deliveryOrder.value.clear();
      } finally {
        isLoadingAssigned.value = false;
      }
    });
  }

  completedAllDeliveryController() {
    DeliveryRepository().completedAllDelivery(userID.value.toString()).then((e) {
      print("DeliveryModel data is $e");
      isLoadingAssigned.value = true;
      try {
        if (e['status'] == 'success') {
          DeliveryModel model = DeliveryModel.fromJson(e);
          completedAllDelivery.value = model.data!.data;
        }
      } catch (err) {
        completedAllDelivery.value.clear();
      } finally {
        isLoadingAssigned.value = false;
      }
    });
  }
  assignedDeliveryController() {
    DeliveryRepository().assignedDelivery(userID.value.toString()).then((e) {
      print("DeliveryModel data is $e");
      isLoadingAssigned.value = true;
      try {
        if (e['status'] == 'success') {
          DeliveryModel model = DeliveryModel.fromJson(e);
          completedAllDelivery.value = model.data!.data;
        }
      } catch (err) {
        completedAllDelivery.value.clear();
      } finally {
        isLoadingAssigned.value = false;
      }
    });
  }
  deliveredDeliveryController() {
    DeliveryRepository().deliveredDelivery(userID.value.toString()).then((e) {
      print("DeliveryModel data is $e");
      isLoadingAssigned.value = true;
      try {
        if (e['status'] == 'success') {
          DeliveryModel model = DeliveryModel.fromJson(e);
          deliveredDelivery.value = model.data!.data;
        }
      } catch (err) {
        deliveredDelivery.value.clear();
      } finally {
        isLoadingAssigned.value = false;
      }
    });
  }

  Future<void> orderDetail() async {
    isLoadingDetail.value = true;
    try {
      final e = await OrderRepository().orderDetail(orderId.value.toString());
      if (e['status'] == 'success') {
        final model = OrderDetailsModel.fromJson(e);
        orderDetails.value = model;

        Get.toNamed(Routes.ORDER_DETAIL);
      } else {
        orderDetails.value = const OrderDetailsModel();
      }
    } catch (_) {
      orderDetails.value = const OrderDetailsModel();
    } finally {
      isLoadingDetail.value = false;
    }
  }

  Future<void> changeDeliveryStatus(status) async {

    try {
      final e = await OrderRepository().changeOrderStatus(orderId.value.toString(), status);
      if (e['status'] == 'success') {
        assignedDelivery();
        Get.showSnackbar(Ui.SuccessSnackBar(
            message: e['message'], title: 'Success'.tr));
      } else {

      }
    } catch (_) {

    } finally {

    }
  }
}
