// lib/app/modules/product/views/product_detail_page.dart
//
// IMPORTANT
// - Uses GetView<ProductController> (as you requested)
// - No StatefulWidget
// - No PageController (so no dispose needed)
// - Works with your controller variables:
//   productDetailLoading, productDetailError, productDetail
// - Uses ProductDetail from: app/models/product/product_detail.dart

import 'package:ecom_user_flutter/app/api_providers/company_data.dart';
import 'package:ecom_user_flutter/app/modules/cart/controller/cart_controller.dart';
import 'package:ecom_user_flutter/app/modules/products/controller/product_controller.dart';
import 'package:ecom_user_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecom_user_flutter/app/models/ecom/product/product_detail.dart';

class ProductDetailPage extends GetView<ProductController> {
  ProductDetailPage({super.key});

  // Local UI state (safe in Stateless with Obx)
  final RxInt _pageIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Trigger fetch once (idempotent guard is in controller: productDetailLoading)
    final args = Get.arguments;
    final int? id = (args is Map) ? args['id'] as int? : args as int?;
    if (id != null && controller.productDetail.value?.id != id) {
      // If you navigate between details, this prevents reusing stale detail
      controller.getProductDetail(id);
      controller.resetQty(); // optional but recommended
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        actions: [
          Obx(
            () {
              return _CartActionButton(
                count: Get.find<CartController>().cart.value?.totalItems ?? 0, // wire later from cart controller
                onTap: () {
                   Get.toNamed(Routes.CART_VIEW);
                },
              );
            }
          ),
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.black87),
            onPressed: () {
              // Share later (share_plus)
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black87),
            onPressed: () {
              // Wishlist later
            },
          ),
          const SizedBox(width: 6),
        ],
      ),

      // 3) Cart and buy now button in bottom bar
      bottomNavigationBar: Obx(() {
        final d = controller.productDetail.value;
        final unitPrice = (d?.unitPrice ?? 0).toDouble();
        final qty = controller.quantity.value;
        final totalPrice = unitPrice * qty;

        return SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 18,
                  color: Colors.black.withOpacity(0.08),
                  offset: const Offset(0, -6),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F214C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: (d == null) ? null : () {
                         controller.addToCart(productId:d.id, qty: qty);
                      },
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF4B73E),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: (d == null) ? null : () {
                       Get.toNamed(Routes.CART_VIEW);
                      },
                      child: const Text(
                        "Buy Now",
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
        if (controller.productDetailLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.productDetailError.value.isNotEmpty) {
          return _ErrorState(
            message: controller.productDetailError.value,
            onRetry: () {
              if (id != null) controller.getProductDetail(id);
            },
          );
        }

        final d = controller.productDetail.value;
        if (d == null) {
          return const Center(child: Text("No product found"));
        }

        final images = _collectImageUrls(d);

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1) Image section
              _ImageSection(
                pageIndex: _pageIndex,
                images: images,
              ),

              // 2) Product detail section
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      d.name ?? "-",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _Stars(rating: (d.rating ?? 0).toDouble()),
                        const SizedBox(width: 8),
                        Text(
                          "(${d.rating ?? 0})",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "৳${((d.unitPrice ?? 0).toDouble()).toStringAsFixed(2)}/${d.unit ?? ''}",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF1F214C),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              _SellerCard(
                shopName: d.shop?.name ?? "-",
                onTap: () {
                  // Get.toNamed(Routes.SHOP, arguments: {"id": d.shop?.id});
                },
              ),

              const SizedBox(height: 14),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quantity:",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Obx(() {
                      final qty = controller.quantity.value;
                      final stock = d.currentStock ?? 0;

                      return Row(
                        children: [
                          _QtyButton(
                            icon: Icons.remove,
                            onTap: controller.decreaseQty,
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 58,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Text(
                              "$qty",
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          _QtyButton(
                            icon: Icons.add,
                            onTap: () => controller.increaseQty(maxStock: stock),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "($stock)",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      );
                    }),

                    const SizedBox(height: 14),

                    Obx(() {
                      final totalPrice =
                          ((d.unitPrice ?? 0).toDouble()) * controller.quantity.value;

                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF4DE),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFFFE2A8)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Total Price",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Text(
                              "৳${totalPrice.toStringAsFixed(2)}",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),

                    const SizedBox(height: 16),

                    Text(
                      "Description",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      _stripHtml(d.description ?? ""),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black87,
                        height: 1.35,
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // Tries to work with common field names in your model
  List<String> _collectImageUrls(ProductDetail d) {
    final List<String> out = [];

    // primaryImage?.fileName
    final primary = d.primaryImage?.fileName ?? d.primaryImage?.fileName;
    if (primary != null && primary.toString().isNotEmpty) {
      out.add(_asImageUrl(primary.toString()));
    }

    final more = d.images ?? <dynamic>[];
    for (final img in more) {
      // Try common patterns
      final String? fn = (img is Map)
          ? (img['file_name']?.toString() ?? img['fileName']?.toString())
          : (img.fileName?.toString() ?? img.fileName?.toString());

      if (fn != null && fn.isNotEmpty) out.add(_asImageUrl(fn));
    }

    if (out.isEmpty) out.add("");
    return out;
  }

  String _asImageUrl(String fileNameOrUrl) {
   // If your API returns relative path: uploads/all/xxx.png
   // build full URL here. Example:
    return "${CompanyData.image_file_url}/$fileNameOrUrl";
 //   return fileNameOrUrl;
  }

  static String _stripHtml(String html) {
    final text = html
        .replaceAll(RegExp(r"<br\s*/?>", caseSensitive: false), "\n")
        .replaceAll(RegExp(r"</p\s*>", caseSensitive: false), "\n\n")
        .replaceAll(RegExp(r"<[^>]*>"), "")
        .replaceAll("&nbsp;", " ")
        .replaceAll("&amp;", "&")
        .replaceAll("&quot;", "\"")
        .replaceAll("&#39;", "'");

    return text.trim();
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({
    required this.pageIndex,
    required this.images,
  });

  final RxInt pageIndex;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: (i) => pageIndex.value = i,
            itemBuilder: (_, i) {
              final url = images[i];
              if (url.isEmpty) {
                return Container(
                  color: Colors.grey.shade100,
                  alignment: Alignment.center,
                  child: const Icon(Icons.image_outlined, size: 54, color: Colors.black45),
                );
              }

              return Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: Image.network(
                  url,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade100,
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image_outlined, size: 54, color: Colors.black45),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Obx(() {
          final idx = pageIndex.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (i) {
              final active = i == idx;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: active ? 18 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: active ? Colors.black87 : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(99),
                ),
              );
            }),
          );
        }),
      ],
    );
  }
}

class _SellerCard extends StatelessWidget {
  const _SellerCard({required this.shopName, this.onTap});

  final String shopName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border(
            top: BorderSide(color: Colors.grey.shade200),
            bottom: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Icon(Icons.storefront, color: Colors.black54),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Seller",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    shopName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(21),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Icon(Icons.chat_bubble_outline, color: Colors.black54, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  const _QtyButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 46,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Icon(icon, color: Colors.black87),
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  const _Stars({required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    final r = rating.clamp(0, 5);
    final full = r.floor();
    final half = (r - full) >= 0.5;

    return Row(
      children: List.generate(5, (i) {
        if (i < full) {
          return const Icon(Icons.star, size: 18, color: Color(0xFFFFB300));
        }
        if (i == full && half) {
          return const Icon(Icons.star_half, size: 18, color: Color(0xFFFFB300));
        }
        return Icon(Icons.star_border, size: 18, color: Colors.grey.shade400);
      }),
    );
  }
}

class _CartActionButton extends StatelessWidget {
  const _CartActionButton({required this.count, this.onTap});

  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
          if (count > 0)
            Positioned(
              right: -6,
              top: -6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  "$count",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
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
              child: const Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}
