import 'package:flutter/material.dart';

class ProductQuantityBasedPriceUI {
  final String id;
  final TextEditingController minimumController;
  final TextEditingController maximumController;
  final TextEditingController priceController;
  final FocusNode minimumFocusNode;
  final FocusNode maximumFocusNode;
  final FocusNode priceFocusNode;
  ProductQuantityBasedPriceUI({
    this.id = '',
    required this.minimumController,
    required this.maximumController,
    required this.priceController,
    required this.minimumFocusNode,
    required this.maximumFocusNode,
    required this.priceFocusNode,
  });
}
