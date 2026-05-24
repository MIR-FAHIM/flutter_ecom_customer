import 'package:ecom_user_flutter/app/routes/app_pages.dart';
import 'package:ecom_user_flutter/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecom_user_flutter/app/modules/cart/controller/cart_controller.dart';

class SelectedAddress extends GetWidget<CartController> {
  const SelectedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final addresses = controller.userAddress.value;

      if (addresses.isEmpty) {
        return _NoAddressCard(
          onAddTap: () {
            Get.toNamed(Routes.ADD_ADDRESS);
          },
        );
      }

      final selected = controller.selectedAddress;

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderColor),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            _showAddressSelectionSheet(context);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primaryColor,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Address',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      selected?.address?.toString() ?? 'No address details',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tap to change address',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  _showAddressSelectionSheet(context);
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  void _showAddressSelectionSheet(BuildContext context) {
    Get.bottomSheet(
      const _AddressSelectionSheet(),
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
    );
  }
}

class _NoAddressCard extends StatelessWidget {
  const _NoAddressCard({
    required this.onAddTap,
  });

  final VoidCallback onAddTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.errorColor.withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.errorColor.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              Icons.location_off_outlined,
              color: AppColors.errorColor,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add your address first',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'A delivery address is required before placing order.',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          TextButton(
            onPressed: onAddTap,
            child: Text(
              'Add',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddressSelectionSheet extends GetWidget<CartController> {
  const _AddressSelectionSheet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        final addresses = controller.userAddress.value;

        return Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Select Delivery Address',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w900,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              if (addresses.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'No address found',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              else
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final address = addresses[index];
                      final isSelected =
                          controller.selectedAddressIndex.value == index;

                      return _SelectableAddressCard(
                        address: address.address?.toString() ?? '',
                        isSelected: isSelected,
                        onTap: () {
                          controller.selectAddress(index);
                          Get.back();
                        },
                      );
                    },
                  ),
                ),

              const SizedBox(height: 14),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Get.back();
                    Get.toNamed(Routes.ADD_ADDRESS);
                  },
                  icon: Icon(
                    Icons.add_location_alt_outlined,
                    color: AppColors.primaryColor,
                  ),
                  label: Text(
                    'Add New Address',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: AppColors.primaryColor.withOpacity(0.35),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _SelectableAddressCard extends StatelessWidget {
  const _SelectableAddressCard({
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  final String address;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.primaryColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected
                ? activeColor.withOpacity(0.07)
                : AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? activeColor
                  : AppColors.borderColor,
              width: isSelected ? 1.2 : 0.8,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                isSelected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off_rounded,
                color: isSelected ? activeColor : AppColors.textMuted,
                size: 22,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  address.isEmpty ? 'No address details' : address,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight:
                    isSelected ? FontWeight.w900 : FontWeight.w700,
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),
              ),

              if (isSelected) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: activeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Selected',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}