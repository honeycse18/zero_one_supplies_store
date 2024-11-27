import 'package:flutter/cupertino.dart';

class FakeIntroContent {
  String localSVGImageLocation;
  String slogan;
  String content;
  FakeIntroContent({
    required this.localSVGImageLocation,
    required this.slogan,
    required this.content,
  });
}

class BidCategory {
  String name;
  String shortFrame;
  String money;
  ImageProvider<Object> categoryImage;
  BidCategory({
    required this.name,
    required this.shortFrame,
    required this.money,
    required this.categoryImage,
  });
}
