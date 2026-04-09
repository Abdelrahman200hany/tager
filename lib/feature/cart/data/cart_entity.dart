import 'package:tager/core/entity/product_entity.dart';
import 'package:tager/feature/cart/data/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItemList;

  const CartEntity({required this.cartItemList});

  // add new cartEntity to the list if cartitem not found
  void addItem(CartItemEntity item) {
    cartItemList.add(item);
  }
  // remove  cartEntity from the list

  void deleteItem(CartItemEntity item) {
    cartItemList.remove(item);
  }

  // check if the product isExits in cart or not
  bool isExits(ProductEntity product) {
    for (var item in cartItemList) {
      if (item.productEntity == product) {
        return true;
      }
    }
    return false;
  }
  //  if product found we get the cart item if not found we create new cart item

  CartItemEntity getCartItem(ProductEntity product) {
    for (var item in cartItemList) {
      if (item.productEntity == product) {
        return item;
      }
    }

    return CartItemEntity(productEntity: product, counter: 1);
  }

  num calTotalPrice() {
    num totalPrice = 0;
    for (var item in cartItemList) {
      totalPrice += item.calCulatetotalPrice();
    }
    return totalPrice;
  }
}
