import 'package:equatable/equatable.dart';
import 'package:tager/core/entity/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int counter;

  CartItemEntity({required this.productEntity, this.counter = 0});

  num calCulatetotalPrice() {
    return productEntity.productPrice * counter;
  }

  num calCulatetotalweight() {
    return productEntity.unitAmount * counter;
  }

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    if (counter > 0) {
      counter--;
    }
  }

  @override
  List<Object?> get props => [productEntity];
}
