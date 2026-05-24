


import 'package:ecom_user_flutter/app/modules/products/controller/product_controller.dart';
import 'package:ecom_user_flutter/app/modules/products/view/widgets/product_card_widget.dart' ;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRestaurantProducts extends GetView<ProductController> {
  const HomeRestaurantProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final loading = controller.isHomeSectionLoading.value;
      final products = controller.restaurantProducts;

      if (loading && products.isEmpty) {
        return const _FeaturedSkeleton();
      }

      if (products.isEmpty) {
        return const SizedBox.shrink();
      }

      return Container(
        color: const Color(0xFFF6EAD3),
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                "Baby Care",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: Get.height*.24,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, i) {
                  return ProductCard(
                    product: products[i],
                    onTap: () {
                      // TODO: navigate to product detail
                      // Get.toNamed(Routes.PRODUCT_DETAILS, arguments: products[i].id);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
class _FeaturedSkeleton extends StatelessWidget {
  const _FeaturedSkeleton();

  @override
  Widget build(BuildContext context) {
    Widget box() => Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14),
      ),
    );

    return Container(
      color: const Color(0xFF1F214C),
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              height: 20,
              width: 160,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 240,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, __) => box(),
            ),
          ),
        ],
      ),
    );
  }
}
