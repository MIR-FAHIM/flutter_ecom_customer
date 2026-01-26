import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:ecom_delivery_flutter/app/modules/home/controllers/home_controller.dart';

import 'package:ecom_delivery_flutter/app/routes/app_pages.dart';
import 'package:ecom_delivery_flutter/common/ui.dart';

class IconModel {
  String? title;
  String? image;
  VoidCallback? press;
  IconModel({this.title, this.image, this.press});
}

List<IconModel> iconButtonData = [
  IconModel(
      title: 'Mobile Recharge',
      image: "assets/images/phone.png",
      press: () {
        // Get.offNamed(Routes.RECHARGE);;

      }),
  IconModel(
      title: 'Mobile Banking',
      image: "assets/images/mobile_banking.png",
      press: () {

      }),
  IconModel(
      title: 'Bill Payment',
      image: "assets/images/bill_payment.png",
      press: () {

      }),
  // IconModel(
  //     title: 'Add Balance',
  //     image: "assets/images/list.png",
  //     press: () {
  //       Get.toNamed(Routes.Add_Balance_Dashboard_View);
  //     }),

  IconModel(
      title: 'E-ticketing',
      image: "assets/images/booking.png",
      press: () {

        //Get.toNamed(Routes.BUS_TICKET);
      }),
  IconModel(
      title: 'Sales',
      image: "assets/images/cart.png",
      press: () {

      }),
  IconModel(
      title: 'My shop',
      image: "assets/images/shop.png",
      press: () {

      }),
];

