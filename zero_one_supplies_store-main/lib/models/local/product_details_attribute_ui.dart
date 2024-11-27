import 'package:ecomikstoreapp/models/api_responses/product_elements_response.dart';
import 'package:flutter/material.dart';

class ProductAttributeUI {
  final String id;
  final List<ProductElementAttribute> attributes;
  ProductElementAttribute? selectedAttribute;
  bool isColorSelected;
  List<ProductAttributeOptionUI> options;
  ProductAttributeUI({
    this.id = '',
    this.attributes = const [],
    this.selectedAttribute,
    this.isColorSelected = false,
    this.options = const [],
  });
}

class ProductAttributeOptionUI {
  final String id;
  final List<String>? options;
  String? selectedOption;
  final TextEditingController valueController;
  final FocusNode valueFocusNode;
  final TextEditingController priceController;
  final FocusNode priceFocusNode;
  ProductAttributeOptionUI({
    this.id = '',
    this.options,
    this.selectedOption,
    required this.valueController,
    required this.priceController,
    required this.valueFocusNode,
    required this.priceFocusNode,
  });
}
