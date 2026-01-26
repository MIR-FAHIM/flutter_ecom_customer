import 'dart:io';

import 'package:ecom_delivery_flutter/app/api_providers/company_data.dart';
import 'package:ecom_delivery_flutter/app/modules/home/views/widgets/dashboard_card.dart';

import 'package:ecom_delivery_flutter/app/modules/home/widgets/home_menu.dart';
import 'package:ecom_delivery_flutter/app/modules/root/controllers/root_controller.dart';
import 'package:ecom_delivery_flutter/app/routes/app_pages.dart';
import 'package:ecom_delivery_flutter/app/services/auth_service.dart';
import 'package:ecom_delivery_flutter/common/Color.dart';
import 'package:ecom_delivery_flutter/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: AppColors.secondbackgroundColor,
              title: Text("Exit App",
                  style: TextStyle(color: AppColors.homeTextColor1)),
              content: Text("Are you sure you want to exit?",
                  style: TextStyle(color: AppColors.homeTextColor2)),
              actions: [
                TextButton(
                  child: Text("No",
                      style: TextStyle(color: AppColors.primaryColor)),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                TextButton(
                  child: Text("Yes",
                      style: TextStyle(color: AppColors.redTextColor)),
                  onPressed: () {
                    exit(0);
                  },
                ),
              ],
            );
          },
        );
        return shouldExit ?? false;
      },
      child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            title:
                Text("Home", style: TextStyle(color: AppColors.homeTextColor1)),
            elevation: 0,
            actions: [
              InkWell(
                  onTap: () {
                    Get.toNamed(Routes.NOTIFICATIONVIEW);
                  },
                  child: Icon(Icons.notification_important_rounded)),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: AppColors.backgroundColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Menu',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      Image(
                        height: Get.height * .1,
                        width: Get.width * .3,
                        image: AssetImage(
                          CompanyData.companyLogo,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home, color: AppColors.primaryColor),
                  title: Text('Home',
                      style: TextStyle(color: AppColors.homeTextColor1)),
                  onTap: () {
                    // Handle navigation
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading:
                      Icon(Icons.exit_to_app, color: AppColors.redTextColor),
                  title: Text('Log Out',
                      style: TextStyle(color: AppColors.redTextColor)),
                  onTap: () {
                    Get.find<AuthService>().removeCurrentUser();
                    Get.toNamed(Routes.SPLASHSCREEN);
                  },
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashboardCard(
                      width: Get.width * .47,
                      backgroundColor: Colors.green,
                      icon: Icons.people,
                      label: "Completed Delivery",
                      value: "1,248",
                      onPressed: () {
                        // navigate or trigger action
                      },
                    ),
                    DashboardCard(
                      width: Get.width * .47,
                      backgroundColor: Colors.red,
                      icon: Icons.people,
                      label: "Pending Delivery",
                      value: "1,248",
                      onPressed: () {
                        // navigate or trigger action
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashboardCard(
                      width: Get.width * .47,
                      backgroundColor: Colors.orange,
                      icon: Icons.people,
                      label: "Completed Delivery",
                      value: "1,248",
                      onPressed: () {
                        // navigate or trigger action
                      },
                    ),
                    DashboardCard(
                      width: Get.width * .47,
                      backgroundColor: Colors.blue,
                      icon: Icons.people,
                      label: "Pending Delivery",
                      value: "1,248",
                      onPressed: () {
                        // navigate or trigger action
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Container(
                  color: Colors.white,
                  height: Get.height*.5,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.redAccent,
                        width: Get.width,
                        height: Get.height*.1,

                        child: InkWell(

                          onTap: (){

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                              children: [
                                Icon(
                                  Icons.cancel,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Cancelled Delivery',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '10',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                        backgroundColor: Colors.red,

                                  child: Icon(Icons.bus_alert, color: Colors.white,),
                                ),
                                Text(
                                  'On the way'
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                        backgroundColor: Colors.red,

                                  child: Icon(Icons.bus_alert, color: Colors.white,),
                                ),
                                Text(
                                  'On the way'
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                        backgroundColor: Colors.red,

                                  child: Icon(Icons.bus_alert, color: Colors.white,),
                                ),
                                Text(
                                  'On the way'
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
