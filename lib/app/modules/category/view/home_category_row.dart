// lib/app/modules/home/widgets/home_category_row.dart

import 'package:ecom_user_flutter/app/api_providers/company_data.dart';
import 'package:ecom_user_flutter/app/models/ecom/product/category_model.dart';
import 'package:ecom_user_flutter/app/modules/category/controller/category_controller.dart';
import 'package:ecom_user_flutter/app/modules/products/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategoryRow extends GetView<CategoryController> {
  const HomeCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final loading = controller.isLoading.value;
      final items = controller.categories;
      final err = controller.error.value;

      if (loading && items.isEmpty) {
        return const _CategoryGridSkeleton();
      }

      if (items.isEmpty) {
        if (err.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    err,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: controller.getCategories,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      }

      return SizedBox(
        height: 72 * 2 + 10,
        child: GridView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: .4,
          ),
          itemBuilder: (context, index) => _CategoryChip(item: items[index]),
        ),
      );
    });
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.item});

  final CategoryItem item;

  @override
  Widget build(BuildContext context) {
    final title = (item.name ?? "").trim();
    final imageUrl = item.banner?.resolvedUrl(baseUrl: CompanyData.image_file_url);
    final bg = _colorFromId(item.id);

    return InkWell(
      onTap: (){

        Get.find<ProductController>().openCategoryWiseProducts(item.id);

      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: bg.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: (imageUrl == null || imageUrl.trim().isEmpty)
                  ? const Icon(Icons.category_outlined, color: Colors.black87)
                  : Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                const Icon(Icons.category_outlined, color: Colors.black87),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title.isEmpty ? "Category" : title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _colorFromId(int? id) {
    const palette = [
      Color(0xFFF4D02D),
      Color(0xFFA1A39A),
      Color(0xFFD2C1B1),
      Color(0xFFB89C9A),
      Color(0xFFB7D7B0),
      Color(0xFFF6EAD3),
      Color(0xFFBFD7EA),
      Color(0xFFE7C6FF),
    ];
    final i = (id ?? 0).abs() % palette.length;
    return palette[i];
  }
}

class _CategoryGridSkeleton extends StatelessWidget {
  const _CategoryGridSkeleton();

  @override
  Widget build(BuildContext context) {
    Widget box() => Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(14),
      ),
    );

    return SizedBox(
      height: 72 * 2 + 10,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3.6,
        ),
        itemBuilder: (_, __) => box(),
      ),
    );
  }
}
