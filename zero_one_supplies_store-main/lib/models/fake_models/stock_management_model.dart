import 'package:ecomikstoreapp/models/fake_models/stock_color_model.dart';
import 'package:flutter/material.dart';

class StoreManagementModel {
  final String productImageUrl;
  final String productName;
  final int productCount;
  final double price;

  final List<StockColorModel> colorNames;
  StoreManagementModel({
    Key? key,
    this.productImageUrl = '',
    this.productName = '',
    this.price = 0,
    this.productCount = 0,
    this.colorNames = const [],
  });
}
