import 'package:ecom_delivery_flutter/app/api_providers/company_data.dart';
import 'package:ecom_delivery_flutter/app/models/company_module_permission_model.dart';

import 'package:ecom_delivery_flutter/app/modules/home/views/profile_view.dart';
import 'package:ecom_delivery_flutter/app/repositories/auth_repositories.dart';
import 'package:ecom_delivery_flutter/app/routes/app_pages.dart';
import 'package:ecom_delivery_flutter/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_delivery_flutter/app/models/notification/popup_image_notification.dart';
import 'package:ecom_delivery_flutter/app/modules/home/views/home_view.dart';


class RootController extends GetxController {
  //TODO: Implement RootController
  final currentIndex = 0.obs;
  final notificationType = ''.obs;
  final popNoti = true.obs;
  final imagePopUrl = "".obs;
  final imageUrlPop = "".obs;
  final companyPermissionModel = CompanyModulePerModel().obs;
  final imageNotificationPopList = <NotiDatum>[].obs;
  @override
  void onInit() {
    super.onInit();


    //

  }

  @override
  void onReady() {
    super.onReady();


  }

  @override
  void onClose() {}

  List<Widget> pages = [
    HomeView(),
    HomeView(),
    HomeView(),
    //MyAttendanceReportPage(),

    ProfileView(),

  ];

  Widget get currentPage => pages[currentIndex.value];


}
