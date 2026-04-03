

import 'package:tager/core/entity/review_entity.dart';


class ProductEntity {
  final String productName, productDes, productCode;
  final int productPrice, unitAmount, numberOfCalories, expretationsMounths;
  final bool isFeature;
  final bool isOrganic;
  final num avgRating = 0, ratingCount = 0;
  final List<ReviewEntitiy> reviews;

  String? productImage;

  ProductEntity({
    required this.reviews,
    required this.productName,
    required this.productDes,
    required this.productCode,
    required this.productPrice,
    required this.unitAmount,
    required this.numberOfCalories,
    required this.expretationsMounths,
    required this.isFeature,

    this.productImage,
    this.isOrganic = false,
  });
}