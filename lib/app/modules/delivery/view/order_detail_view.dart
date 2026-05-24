import 'package:ecom_user_flutter/app/models/ecom/delivery/order_detail.dart';
import 'package:ecom_user_flutter/app/modules/delivery/controller/delivery_controller.dart';
import 'package:ecom_user_flutter/app/modules/delivery/view/widgets/empty_state.dart';
import 'package:ecom_user_flutter/app/repositories/order_rep.dart';
import 'package:ecom_user_flutter/common/Color.dart';
import 'package:ecom_user_flutter/app/api_providers/company_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailView extends GetView<DeliveryController> {
  OrderDetailView({Key? key}) : super(key: key);

  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    // Fetch once after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.orderDetails.value.data == null &&
          controller.isLoadingDetail.isFalse) {
        controller.orderDetail();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Order Details"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: _size.height,
        width: _size.width,
        child: Obx(() {
          if (controller.isLoadingDetail.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final model = controller.orderDetails.value;
          final data = model.data;

          if (data == null) {
            return EmptyState(
              onRefresh: controller.orderDetail,
            );
          }

          final delivery = data.deliveryMan;
          final rider = delivery?.deliveryMan;

          return RefreshIndicator(
            onRefresh: () async {
              controller.orderDetail();
            },
            child: ListView(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 18),
              children: [
                _HeaderCard(
                  orderNumber: data.orderNumber ?? "-",
                  orderStatus: data.status ?? "-",
                  paymentStatus: data.paymentStatus ?? "-",
                  total: data.total ?? 0,
                  createdAt: data.createdAt,
                ),
                const SizedBox(height: 10),

                _CustomerCard(
                  customerName: data.customerName ?? "-",
                  customerPhone: data.customerPhone ?? "-",
                  address: data.shippingAddress ?? "-",
                  zone: data.zone ?? "-",
                ),
                const SizedBox(height: 10),

                if (rider != null)
                  _RiderCard(
                    name: rider.name ?? "-",
                    phone: rider.phone ?? "-",
                    address: rider.address ?? "-",
                    status: delivery?.status ?? "-",
                    onCall: () {
                      // Put your caller function here
                      // Ui.launchCaller(rider.phone ?? "");
                    },
                  ),

                if (rider != null) const SizedBox(height: 10),

                _ItemsCard(items: data.items),
                const SizedBox(height: 10),

                _SummaryCard(
                  subtotal: data.subtotal ?? 0,
                  shippingFee: data.shippingFee ?? 0,
                  discount: data.discount ?? 0,
                  total: data.total ?? 0,
                  note: data.note,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

/// CONTROLLER PATCH (recommended)
/// Your current function sets isLoadingDetail late.
/// Use this version to avoid UI flicker and ensure correct loading.
extension DeliveryControllerOrderDetailFix on DeliveryController {
  Future<void> orderDetailFixed() async {
    isLoadingDetail.value = true;
    try {
      final e = await OrderRepository().orderDetail(orderId.value.toString());
      if (e['status'] == 'success') {
        final model = OrderDetailsModel.fromJson(e);
        orderDetails.value = model;
      } else {
        orderDetails.value = const OrderDetailsModel();
      }
    } catch (_) {
      orderDetails.value = const OrderDetailsModel();
    } finally {
      isLoadingDetail.value = false;
    }
  }
}

/// UI WIDGETS
class _KeyValue extends StatelessWidget {
  const _KeyValue({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black54),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
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
class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    required this.orderNumber,
    required this.orderStatus,
    required this.paymentStatus,
    required this.total,
    required this.createdAt,
  });

  final String orderNumber;
  final String orderStatus;
  final String paymentStatus;
  final int total;
  final DateTime? createdAt;

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "#$orderNumber",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              _StatusChip(
                label: _prettyStatus(orderStatus),
                color: _statusColor(orderStatus),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _KeyValue(
                  label: "Payment",
                  value: _prettyStatus(paymentStatus),
                  icon: Icons.verified_outlined,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _KeyValue(
                  label: "Total",
                  value: "\$${total.toString()}",
                  icon: Icons.payments_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _KeyValue(
            label: "Created",
            value: createdAt == null ? "-" : _fmtDate(createdAt!),
            icon: Icons.calendar_month_outlined,
          ),
        ],
      ),
    );
  }
}

class _CustomerCard extends StatelessWidget {
  const _CustomerCard({
    required this.customerName,
    required this.customerPhone,
    required this.address,
    required this.zone,
  });

  final String customerName;
  final String customerPhone;
  final String address;
  final String zone;

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      title: "Customer",
      child: Column(
        children: [
          _InfoRow(icon: Icons.person_outline, text: customerName),
          const SizedBox(height: 8),
          _InfoRow(icon: Icons.phone_outlined, text: customerPhone),
          const SizedBox(height: 8),
          _InfoRow(icon: Icons.location_on_outlined, text: address, maxLines: 3),
          const SizedBox(height: 8),
          _InfoRow(icon: Icons.map_outlined, text: zone),
        ],
      ),
    );
  }
}

class _RiderCard extends StatelessWidget {
  const _RiderCard({
    required this.name,
    required this.phone,
    required this.address,
    required this.status,
    this.onCall,
  });

  final String name;
  final String phone;
  final String address;
  final String status;
  final VoidCallback? onCall;

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      title: "Delivery Man",
      trailing: _StatusChip(
        label: _prettyStatus(status),
        color: _statusColor(status),
      ),
      child: Column(
        children: [
          _InfoRow(icon: Icons.badge_outlined, text: name),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _InfoRow(icon: Icons.phone_outlined, text: phone),
              ),
              if (onCall != null) ...[
                const SizedBox(width: 10),
                OutlinedButton.icon(
                  onPressed: onCall,
                  icon: const Icon(Icons.call_outlined, size: 18),
                  label: const Text("Call"),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          _InfoRow(icon: Icons.location_on_outlined, text: address, maxLines: 3),
        ],
      ),
    );
  }
}

class _ItemsCard extends StatelessWidget {
  const _ItemsCard({required this.items});

  final List<OrderItem> items;

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      title: "Items",
      child: Column(
        children: [
          if (items.isEmpty)
            Text(
              "No items found.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
          for (int i = 0; i < items.length; i++) ...[
            _ItemTile(item: items[i]),
            if (i != items.length - 1)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(height: 1, color: Colors.grey.shade200),
              ),
          ],
        ],
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({required this.item});

  final OrderItem item;

  @override
  Widget build(BuildContext context) {
    final name = item.productName ?? "-";
    final qty = item.qty ?? 0;
    final unit = item.unitPrice ?? 0;
    final total = item.lineTotal ?? (qty * unit);
    final st = item.status ?? "-";

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: const Icon(Icons.shopping_bag_outlined, color: Colors.black54),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  _MiniPill(label: "Qty: $qty"),
                  _MiniPill(label: "Unit:"),
                  _MiniPill(label: "Total:"),
                  _MiniPill(label: _prettyStatus(st)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.subtotal,
    required this.shippingFee,
    required this.discount,
    required this.total,
    this.note,
  });

  final int subtotal;
  final int shippingFee;
  final int discount;
  final int total;
  final String? note;

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      title: "Summary",
      child: Column(
        children: [
          _SummaryRow(label: "Subtotal", value: subtotal),
          const SizedBox(height: 8),
          _SummaryRow(label: "Shipping", value: shippingFee),
          const SizedBox(height: 8),
          _SummaryRow(label: "Discount", value: discount),
          const SizedBox(height: 12),
          Divider(height: 1, color: Colors.grey.shade200),
          const SizedBox(height: 12),
          _SummaryRow(label: "Total", value: total, bold: true),
          if (note != null && note!.trim().isNotEmpty) ...[
            const SizedBox(height: 14),
            _InfoRow(icon: Icons.notes_outlined, text: note!, maxLines: 4),
          ],
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.bold = false,
  });

  final String label;
  final int value;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: bold ? FontWeight.w800 : FontWeight.w600,
      color: Colors.black87,
    );

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text("$value", style: style),
      ],
    );
  }
}

class _CardShell extends StatelessWidget {
  const _CardShell({
    required this.child,
    this.title,
    this.trailing,
  });

  final Widget child;
  final String? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                    title!,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 12),
          ],
          child,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.text,
    this.maxLines = 1,
  });

  final IconData icon;
  final String text;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: maxLines > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: Colors.black54),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black87,
              height: 1.25,
            ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _MiniPill extends StatelessWidget {
  const _MiniPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Colors.black87,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withOpacity(0.35), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w800,
          fontSize: 12,
        ),
      ),
    );
  }
}



/// HELPERS

String _fmtDate(DateTime dt) {
  String two(int v) => v < 10 ? "0$v" : "$v";
  return "${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}";
}

String _prettyStatus(String s) {
  final v = s.trim().replaceAll("_", " ").replaceAll("-", " ");
  if (v.isEmpty) return "-";
  return v.split(" ").map((w) {
    if (w.isEmpty) return w;
    final lower = w.toLowerCase();
    return lower[0].toUpperCase() + lower.substring(1);
  }).join(" ");
}

Color _statusColor(String s) {
  final v = s.toLowerCase();
  if (v.contains("delivered") || v.contains("completed")) return Colors.green;
  if (v.contains("cancel")) return Colors.red;
  if (v.contains("pending")) return Colors.orange;
  if (v.contains("processing")) return Colors.blue;
  if (v.contains("assigned")) return Colors.purple;
  return Colors.teal;
}
