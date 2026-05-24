// lib/app/modules/home/widgets/home_category_products_section.dart

import 'package:flutter/material.dart';
import 'package:ecom_user_flutter/app/api_providers/company_data.dart';

class HomeCategoryProductsSection extends StatelessWidget {
  const HomeCategoryProductsSection({
    super.key,
    required this.title,
    required this.backgroundColor,
  });

  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final items = const [
      _DemoProduct(title: "Demo product one", price: 160),
      _DemoProduct(title: "Demo product two", price: 1000),
      _DemoProduct(title: "Demo product three", price: 370),
    ];

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 215,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) => _ProductCard(p: items[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoProduct {
  final String title;
  final int price;
  const _DemoProduct({required this.title, required this.price});
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.p});

  final _DemoProduct p;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 105,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const Icon(Icons.image_outlined, size: 44, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          Text(
            p.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          Text(
            "${p.price}",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
