// lib/app/modules/products/view/today_deal_products.dart

import 'package:ecom_user_flutter/app/models/ecom/product/category_model.dart';
import 'package:ecom_user_flutter/app/modules/products/controller/product_controller.dart';
import 'package:ecom_user_flutter/app/modules/products/view/widgets/product_card_widget.dart';
import 'package:ecom_user_flutter/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodayDealProducts extends GetView<ProductController> {
  const TodayDealProducts({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.initTodayDealProductsPage();
    });

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            _TodayDealHeader(controller: controller),

            Expanded(
              child: Obx(() {
                if (controller.isTodayDealLoading.value &&
                    controller.todayDealProducts.isEmpty) {
                  return const _TodayDealGridSkeleton();
                }

                if (controller.error.value.isNotEmpty &&
                    controller.todayDealProducts.isEmpty) {
                  return _ErrorState(
                    message: controller.error.value,
                    onRetry: () {
                      controller.getTodayDealProducts(reset: true);
                    },
                  );
                }

                if (controller.todayDealProducts.isEmpty) {
                  return const _EmptyState();
                }

                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.axis == Axis.vertical &&
                        notification.metrics.pixels >=
                            notification.metrics.maxScrollExtent - 250) {
                      controller.loadMoreTodayDealProducts();
                    }

                    return false;
                  },
                  child: RefreshIndicator(
                    color: AppColors.primaryColor,
                    onRefresh: () async {
                      await controller.getTodayDealProducts(reset: true);
                    },
                    child: CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.fromLTRB(10, 12, 10, 16),
                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                if (index >=
                                    controller.todayDealProducts.length) {
                                  return const Center(
                                    child: SizedBox(
                                      height: 26,
                                      width: 26,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  );
                                }

                                final product =
                                controller.todayDealProducts[index];

                                return ProductCard(product: product);
                              },
                              childCount:
                              controller.todayDealProducts.length +
                                  (controller
                                      .isTodayDealMoreLoading.value
                                      ? 1
                                      : 0),
                            ),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 0.58,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _TodayDealHeader extends StatelessWidget {
  const _TodayDealHeader({
    required this.controller,
  });

  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.todayDealColor,
                  AppColors.primaryColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(22),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () => Get.back(),
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Todays Deal",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Obx(() {
                            return Text(
                              "${controller.todayDealTotal.value} products available",
                              style: TextStyle(
                                color: AppColors.textWhite.withOpacity(0.78),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),

                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.event_available_outlined,
                        color: AppColors.offerYellow,
                        size: 25,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: controller.searchCtrl.value,
                  onChanged: controller.onSearchChangedTodayDealProducts,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                  decoration: InputDecoration(
                    hintText: "Search today's deal...",
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: AppColors.primaryColor,
                    ),
                    suffixIcon: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        controller.clearSearch();
                        controller.getTodayDealProducts(reset: true);
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: AppColors.textMuted,
                      ),
                    ),
                    filled: true,
                    fillColor: AppColors.backgroundColor,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 13,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Row(
              children: [
                Expanded(
                  child: Obx(() {
                    final categories = controller.categories;

                    return _DropBox<CategoryItem>(
                      hint: "Product",
                      value: controller.selectedCategory.value == null
                          ? null
                          : categories.firstWhereOrNull(
                            (item) =>
                        item.id ==
                            controller.selectedCategory.value,
                      ),
                      items: categories,
                      labelOf: (item) =>
                          (item.name ?? "Category").trim(),
                      onChanged: (item) {
                        controller.setTodayDealCategory(item?.id);
                      },
                    );
                  }),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Obx(() {
                    final shops = controller.shops;

                    return _DropBox<dynamic>(
                      hint: "Seller",
                      value: controller.selectedShop.value == null
                          ? null
                          : shops.firstWhereOrNull(
                            (item) =>
                        item.id == controller.selectedShop.value,
                      ),
                      items: shops,
                      labelOf: (item) =>
                          (item.name ?? "Seller").toString(),
                      onChanged: (item) {
                        controller.setTodayDealShop(item?.id);
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DropBox<T> extends StatelessWidget {
  const _DropBox({
    required this.hint,
    required this.value,
    required this.items,
    required this.labelOf,
    required this.onChanged,
  });

  final String hint;
  final T? value;
  final List<T> items;
  final String Function(T) labelOf;
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.borderColor,
          width: 0.8,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isExpanded: true,
          value: value,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.primaryColor,
          ),
          hint: Text(
            hint,
            style: TextStyle(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w800,
              fontSize: 12,
            ),
          ),
          items: [
            DropdownMenuItem<T>(
              value: null,
              child: Text(
                "All",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ),
            ...items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(
                  labelOf(item),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
              );
            }),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _TodayDealGridSkeleton extends StatelessWidget {
  const _TodayDealGridSkeleton();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.58,
      ),
      itemBuilder: (_, __) {
        return const _ProductSkeletonCard();
      },
    );
  }
}

class _ProductSkeletonCard extends StatelessWidget {
  const _ProductSkeletonCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.borderColor,
          width: 0.8,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 52,
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.scaffoldBackground,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Expanded(
            flex: 48,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(7),
              color: const Color(0xFFF3F4F6),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SkeletonBox(width: 82, height: 10, radius: 5),
                  SizedBox(height: 5),
                  _SkeletonBox(width: 62, height: 9, radius: 5),
                  Spacer(),
                  _SkeletonBox(width: 55, height: 14, radius: 6),
                  SizedBox(height: 6),
                  _SkeletonBox(width: 92, height: 9, radius: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkeletonBox extends StatelessWidget {
  const _SkeletonBox({
    required this.width,
    required this.height,
    required this.radius,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(radius),
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
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                color: AppColors.todayDealColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(
                Icons.event_busy_outlined,
                size: 42,
                color: AppColors.todayDealColor,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              "No deals found",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Try changing search, product, or seller filter.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                color: AppColors.errorColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 42,
                color: AppColors.errorColor,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              "Something went wrong",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 14),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text(
                "Retry",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}