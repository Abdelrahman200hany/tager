

import 'package:tager/core/entity/product_entity.dart';
import 'package:tager/core/helpers/get_avg_rating.dart';
import 'package:tager/core/models/review_model.dart';

class ProductModel {
  final String productName, productDes, productCode;
  final int productPrice, unitAmount, numberOfCalories, expretationsMounths;
  final bool isFeature;
  final bool isOrganic;
  final num avgRating, ratingCount = 0;
  final List<ReviewModel> reviews;
  final int sellingCount;

  String? productImage;

  ProductModel({
    this.avgRating = 0,
    this.sellingCount = 0,
    required this.productName,
    required this.productDes,
    required this.productCode,
    required this.productPrice,
    required this.unitAmount,
    required this.numberOfCalories,
    required this.expretationsMounths,
    required this.isFeature,
    required this.isOrganic,
    required this.reviews,

    this.productImage,
  });

  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
      avgRating: getAvgRating(json['reviews']),
      sellingCount: json['sellingCount'],
      reviews: (json['reviews'] as List)
          .map((e) => ReviewModel.fromjson(e))
          .toList(),
      expretationsMounths: json['expretationsMounths'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      productCode: json['productCode'],
      isFeature: json['isFeature'],
      productDes: json['productDes'],
      productPrice: json['productPrice'],
      productName: json['productName'],
      productImage: json['productImage'],
      isOrganic: json['isOrganic'],
    );
  }

  // convert the model ti entity to use it in the ui

  ProductEntity toEntity() {
    return ProductEntity(
      reviews: reviews.map((e) => e.toEntity()).toList(),
      expretationsMounths: expretationsMounths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      productCode: productCode,
      isFeature: isFeature,
      productDes: productDes,
      productPrice: productPrice,
      productName: productName,

      productImage: productImage,
      isOrganic: isOrganic,
    );
  }

  toMap() {
    return {
      'reviews': reviews.map((e) => e.toMap()).toList(),
      'productCode': productCode,
      'isFeature': isFeature,
      'productDes': productDes,
      'productPrice': productPrice,
      'productName': productName,
      // 'productImageFile': productImageFile,
      'productImage': productImage,
      'expretationsMounths': expretationsMounths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
    };
  }

  // factory ProductModel.fromEntity(ProductEntity productEntity) {
  //   return ProductModel(
  //     reviews: productEntity.reviews
  //         .map((e) => ReviewModel.fromEntity(e))
  //         .toList(),
  //     expretationsMounths: productEntity.expretationsMounths,
  //     numberOfCalories: productEntity.numberOfCalories,
  //     unitAmount: productEntity.unitAmount,
  //     productCode: productEntity.productCode,
  //     isFeature: productEntity.isFeature,
  //     productDes: productEntity.productDes,
  //     productPrice: productEntity.productPrice,
  //     productName: productEntity.productName,
  //     productImageFile: productEntity.productImageFile,
  //     productImage: productEntity.productImage,
  //     isOrganic: productEntity.isOrganic,
  //   );
  // }
}
