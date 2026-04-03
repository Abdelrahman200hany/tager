import 'package:tager/core/entity/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    productImage: null,
    reviews: [],
    productName: 'Organic Apple',
    productDes: 'Fresh and juicy organic apples.',
    productCode: 'APL123',
    productPrice: 3,
    unitAmount: 1,
    numberOfCalories: 95,
    expretationsMounths: 6,
    isFeature: true,
  );
}

List<ProductEntity> get dummyProducts {
  return List.generate(8, (index) => getDummyProduct());
}
   
  
//    final String productName, productDes, productCode;
//   final int productPrice, unitAmount, numberOfCalories, expretationsMounths;
//   final bool isFeature;
//   final bool isOrganic;
//   final num avgRating = 0, ratingCount = 0;
//   final List<ReviewEntitiy> reviews;

//   final File productImageFile;
//   String? productImage;
// }