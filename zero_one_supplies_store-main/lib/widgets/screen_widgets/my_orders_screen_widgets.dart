import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:flutter/material.dart';

/// Order status widget for orders screen.
class OrderStatusWidget extends StatelessWidget {
  final String orderStatus;
  const OrderStatusWidget({
    super.key,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    final String statusText;
    final Color statusBackgroundColor;
    switch (orderStatus.toLowerCase()) {
      case 'pending':
        statusText = 'Pending';
        statusBackgroundColor = AppColors.pendingColor;
        break;
      case 'processing':
        statusText = 'Processing';
        statusBackgroundColor = AppColors.tertiaryColor;
        break;
      case 'delivered':
        statusText = 'Delivered';
        statusBackgroundColor = AppColors.successColor;
        break;
      case 'cancelled':
        statusText = 'Cancelled';
        statusBackgroundColor = AppColors.alertColor;
        break;
      default:
        statusText = 'Pending';
        statusBackgroundColor = AppColors.secondaryColor;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: statusBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Text(
        statusText,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
