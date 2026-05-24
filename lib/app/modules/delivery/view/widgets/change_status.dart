import 'package:ecom_user_flutter/app/modules/delivery/controller/delivery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class changeStatus extends GetWidget<DeliveryController> {
  const changeStatus({
    required this.label,
    required this.color,
    required this.orderId,
    required this.currentOrderStatus,
  });

  final String label;
  final String orderId;
  final String currentOrderStatus;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (currentOrderStatus == 'completed' ||
        currentOrderStatus == 'delivered') {
      return Container();
    } else {
      return InkWell(
        onTap: () {
          controller.orderId.value = int.parse(orderId);
          controller.changeDeliveryStatus(label);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: color.withOpacity(0.35), width: 1),
          ),
          child: Column(
            children: [
              Text(
                'Change Status to',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
