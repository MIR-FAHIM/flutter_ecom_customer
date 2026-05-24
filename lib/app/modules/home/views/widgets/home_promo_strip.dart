// lib/app/modules/home/widgets/home_promo_strip.dart

import 'package:flutter/material.dart';

class HomePromoStrip extends StatelessWidget {
  const HomePromoStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const [
      _PromoSpec(title: "Promo banner", subtitle: "Order from app"),
      _PromoSpec(title: "Promo banner", subtitle: "Special offer"),
      _PromoSpec(title: "Promo banner", subtitle: "Discount today"),
    ];

    return SizedBox(
      height: 120,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) => _PromoCard(spec: items[i]),
      ),
    );
  }
}

class _PromoSpec {
  final String title;
  final String subtitle;
  const _PromoSpec({required this.title, required this.subtitle});
}

class _PromoCard extends StatelessWidget {
  const _PromoCard({required this.spec});

  final _PromoSpec spec;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const Icon(Icons.local_offer_outlined, color: Colors.black54),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  spec.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  spec.subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
