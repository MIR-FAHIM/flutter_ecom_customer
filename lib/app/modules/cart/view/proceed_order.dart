// lib/app/modules/order/views/proceed_order_page.dart
//
// ProceedOrderPage UI based on your screenshot:
// 1) AppBar with back + title
// 2) Select Address section (top)
// 3) Cart list section
// 4) Payment method card (Cash on Delivery) with selected check
// 5) Coupon input + Apply button
// 6) Total amount bar + bottom "PLACE MY ORDER" button
//
// Notes:
// - This page is GetX-first and uses GetView.
// - It assumes you already have:
//   - CartController exposing: cartLoading, cartError, cart (Rxn<CartModel>), updateQty(itemId, qty), removeItem(itemId)
//   - AddressController exposing: isLoading, error, addresses (RxList<AddressModel>), selectedAddress (Rxn<AddressModel>), selectAddress(AddressModel)
// - If your controllers have different names, just change the imports and variables.

import 'package:ecom_user_flutter/app/api_providers/company_data.dart';
import 'package:ecom_user_flutter/app/models/ecom/order/cart_model.dart';
import 'package:ecom_user_flutter/app/models/ecom/order/user_address_model.dart';
import 'package:ecom_user_flutter/app/modules/cart/view/widgets/selected_address.dart';
import 'package:ecom_user_flutter/app/modules/cart/view/widgets/user_address.dart';
import 'package:ecom_user_flutter/app/modules/order/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



// Change these imports to your actual controller paths:
import 'package:ecom_user_flutter/app/modules/cart/controller/cart_controller.dart';


class ProceedOrderPage extends GetView<CartController> {
  ProceedOrderPage({super.key});



  // UI-only state
  final TextEditingController couponCtrl = TextEditingController();
  final RxString selectedPayment = 'cod'.obs; // only COD for now

  static const Color navy = Color(0xFF1F214C);
  static const Color beige = Color(0xFFF6E7CC);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Checkout',
          style: theme.textTheme.titleMedium?.copyWith(
            color: navy,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      bottomNavigationBar: Obx(() {
        final cart = controller.cart.value;
        final subtotal = cart?.subtotal ?? 0.0;

        return SafeArea(
          top: false,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 18,
                  color: Colors.black.withOpacity(0.08),
                  offset: const Offset(0, -6),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Coupon row
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
                  child: _CouponRow(
                    controller: couponCtrl,
                    onApply: () {
                      // TODO: call coupon API when available
                      FocusScope.of(context).unfocus();
                      Get.snackbar('Coupon', 'Apply coupon not wired yet');
                    },
                  ),
                ),

                // Total bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: _TotalBar(
                    label: 'Total Amount',
                    amount: 44,
                    onDetails: () {
                      // Optional: show breakdown modal
                      _showTotalDetailsBottomSheet(
                        context,
                        totalItems: cart?.totalItems ?? 0,
                        subtotal: 55,
                      );
                    },
                  ),
                ),

                // Place order button
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                  child: SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: navy,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        final selectedAddress = controller.selectedAddress;

                        if (selectedAddress == null) {
                          Get.snackbar(
                            'Address Required',
                            'Please add or select a delivery address first.',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          return;
                        }
                        if ((cart?.items ?? []).isEmpty) {
                          Get.snackbar('Cart', 'Your cart is empty');
                          return;
                        }

                        controller.proceedToShipping(

                        );
                      },
                      child: const Text(
                        'PLACE MY ORDER',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),

      body: Obx(() {
        // Cart state
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }


        final cart = controller.cart.value;

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1) Address selection section



              SelectedAddress(),
              const SizedBox(height: 14),

              // 2) Cart list
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
                child: Text(
                  'Items',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
              ),

              if ((cart?.items ?? []).isEmpty)
                const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    'No items in cart',
                    style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
                  ),
                )
              else
                Container(
                  height: Get.height*.4,
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                    shrinkWrap: true,
                  //  physics: const NeverScrollableScrollPhysics(),
                    itemCount: cart!.items!.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, i) {
                      final item = cart.items![i];
                      return _CheckoutCartItemCard(
                        item: item,

                      );
                    },
                  ),
                ),

              const SizedBox(height: 6),

              // 3) Payment method section (COD)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
                child: Text(
                  'Payment Method',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 18),
                child: Obx(() {
                  final isSelected = selectedPayment.value == 'cod';
                  return _PaymentMethodCard(
                    title: 'Cash on Delivery',
                    isSelected: isSelected,
                    onTap: () => selectedPayment.value = 'cod',
                  );
                }),
              ),

              const SizedBox(height: 100), // space above bottom bar
            ],
          ),
        );
      }),
    );
  }

  void _showTotalDetailsBottomSheet(
      BuildContext context, {
        required int totalItems,
        required double subtotal,
      }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 14),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Total details',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),
              _kv('Items', '$totalItems'),
              const SizedBox(height: 8),
              _kv('Subtotal', '৳${subtotal.toStringAsFixed(2)}'),
              const SizedBox(height: 14),
            ],
          ),
        );
      },
    );
  }

  Widget _kv(String k, String v) {
    return Row(
      children: [
        Expanded(
          child: Text(
            k,
            style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          v,
          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}


class _CheckoutCartItemCard extends StatelessWidget {
  const _CheckoutCartItemCard({
    required this.item,

  });

  final CartItem item;


  static const Color navy = Color(0xFF1F214C);

  @override
  Widget build(BuildContext context) {
    final product = item.product;
    final title = product?.name ?? 'Product';
    final price = item.unitPrice;
    final qty = item.qty;
    final imgPath = item.product?.primaryImage?.fileName;
    final imgUrl = _asImageUrl(imgPath);


    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            blurRadius: 22,
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 12),
          )
        ],
      ),
      child: Row(
        children: [
          // image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 74,
              height: 74,
              color: Colors.grey.shade100,
              child: (imgUrl == null || imgUrl.isEmpty)
                  ? const Icon(Icons.image_outlined, color: Colors.black45)
                  : Image.network(
                imgUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.broken_image_outlined,
                  color: Colors.black45,
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // title + price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Qty: ${qty.toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: navy,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      '৳${price!.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: navy,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),




        ],
      ),
    );
  }
}

class _QtyIconBtn extends StatelessWidget {
  const _QtyIconBtn({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Icon(icon, color: Colors.black87, size: 20),
      ),
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  const _PaymentMethodCard({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  static const Color navy = Color(0xFF1F214C);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: navy, width: 1.4),
          boxShadow: [
            BoxShadow(
              blurRadius: 22,
              color: Colors.black.withOpacity(0.06),
              offset: const Offset(0, 12),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF4B73E),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.local_shipping_outlined, color: Colors.white),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? Colors.green : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}

class _CouponRow extends StatelessWidget {
  const _CouponRow({
    required this.controller,
    required this.onApply,
  });

  final TextEditingController controller;
  final VoidCallback onApply;

  static const Color navy = Color(0xFF1F214C);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter coupon code',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
          SizedBox(
            height: 52,
            width: 140,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: navy,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
              onPressed: onApply,
              child: const Text(
                'APPLY COUPON',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalBar extends StatelessWidget {
  const _TotalBar({
    required this.label,
    required this.amount,
    required this.onDetails,
  });

  final String label;
  final double amount;
  final VoidCallback onDetails;

  static const Color beige = Color(0xFFF6E7CC);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: beige,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black87),
            ),
          ),
          InkWell(
            onTap: onDetails,
            child: const Text(
              'see details',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black54,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '৳${amount.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
String _asImageUrl(String? fileName) {
  if (fileName == null || fileName.trim().isEmpty) return '';

  // Your API returns "uploads/all/xxx.jpg"
  // In many setups: "${CompanyData.baseUrl}/public/$fileName"
  // If you already store full URL in DB, just return fileName.
  if (fileName.startsWith('http')) return fileName;

  return "${CompanyData.image_file_url}/$fileName";
}