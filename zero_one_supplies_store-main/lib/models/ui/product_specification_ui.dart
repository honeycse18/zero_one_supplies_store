import 'package:flutter/material.dart';

class ProductSpecificationUI {
  final String id;
  final TextEditingController keyController;
  final FocusNode keyFocusNode;
  final TextEditingController valueController;
  final FocusNode valueFocusNode;
  ProductSpecificationUI({
    this.id = '',
    required this.keyController,
    required this.valueController,
    required this.keyFocusNode,
    required this.valueFocusNode,
  });

  factory ProductSpecificationUI.empty() => ProductSpecificationUI(
      keyController: TextEditingController(),
      keyFocusNode: FocusNode(),
      valueController: TextEditingController(),
      valueFocusNode: FocusNode());
}
