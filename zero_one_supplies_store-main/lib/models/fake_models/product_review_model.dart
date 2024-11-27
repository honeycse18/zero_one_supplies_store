import 'package:flutter/material.dart';

class FakeProductReview {
  String reviewerName;
  int rating;
  String reviewDateText;
  String reviewText;
  ImageProvider<Object> reviewerProfileImage;
  FakeProductReview({
    required this.reviewerName,
    required this.rating,
    required this.reviewDateText,
    required this.reviewText,
    required this.reviewerProfileImage,
  });
}
