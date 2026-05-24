// lib/app/modules/cart/views/cart_view.dart

import 'package:ecom_user_flutter/app/models/ecom/order/cart_model.dart';
import 'package:ecom_user_flutter/app/modules/root/controllers/root_controller.dart';
import 'package:ecom_user_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import your controller + models
import 'package:ecom_user_flutter/app/modules/cart/controller/cart_controller.dart';

import 'package:ecom_user_flutter/app/api_providers/company_data.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  static const Color _navy = Color(0xFF1F214C);
  static const Color _beige = Color(0xFFF6E8D6);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return  Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () {
                Get.find<RootController>().currentIndex.value = 0;
                Get.toNamed(Routes.ROOT);
              },
            ),
            title: Text(
              "Shopping Cart",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
            ),
            centerTitle: false,
          ),

          bottomNavigationBar: Obx(() {
            final cart = controller.cart.value;
            final total = controller.totalAmount.value;

            return SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 18,
                      offset: const Offset(0, -6),
                      color: Colors.black.withOpacity(0.08),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: _beige,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total Amount",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Text(
                            "৳$total",
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 54,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _navy,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: (cart == null || !(cart.items?.isNotEmpty ?? false))
                            ? null
                            : () => controller.goToCheckout(),
                        child: const Text(
                          "Proceed To Shipping",
                          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

          body: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.error.value.isNotEmpty) {
              return _ErrorState(
                message: controller.error.value,
                onRetry: () => controller.getActiveCart(reset: true),
              );
            }

            final cart = controller.cart.value;
            final items = cart?.items ?? const <CartItem>[];

            if (cart == null || items.isEmpty) {
              return const _EmptyState();
            }

            // UI in screenshot shows a single shop header above the card.
            // If you later support multiple shops, group here.
            final shopName = '';

            return ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        shopName.isEmpty ? "-" : shopName,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      "৳${controller.totalAmount.value}",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...items.map((it) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _CartItemCard(item: it),
                )),
              ],
            );
          }),
        );

  }
}

class _CartItemCard extends GetView<CartController> {
  const _CartItemCard({required this.item});

  static const Color _navy = Color(0xFF1F214C);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final title = item.product?.name ?? "-";
    final price = item.unitPrice ?? item.product?.unitPrice ?? 0;
    final qty = item.qty ?? 0;

    final imgPath = item.product?.primaryImage?.fileName;
    final imgUrl = _asImageUrl(imgPath);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            blurRadius: 18,
            offset: const Offset(0, 10),
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 92,
              height: 92,
              color: Colors.grey.shade100,
              child: (imgUrl.isEmpty)
                  ? const Icon(Icons.image_outlined, color: Colors.black45, size: 34)
                  : Image.network(
                imgUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.broken_image_outlined,
                  color: Colors.black45,
                  size: 34,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Title + price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "৳$price",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: _navy,
                  ),
                ),
              ],
            ),
          ),

          // Right controls column ( + , qty , delete , - ) as in screenshot
          Column(
            children: [
              _RoundIconButton(
                icon: Icons.add,
                onTap: () => controller.increaseQty(item),
              ),
              const SizedBox(height: 8),
              Text(
                "$qty",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                onPressed: () => controller.removeItem(item),
              ),
              _RoundIconButton(
                icon: Icons.remove,
                onTap: () => controller.decreaseQty(item),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Icon(icon, color: Colors.black87, size: 18),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 54, color: Colors.grey.shade400),
            const SizedBox(height: 10),
            const Text(
              "Your cart is empty",
              style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black87),
            ),
          ],
        ),
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
              style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: onRetry, child: const Text("Retry")),
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
