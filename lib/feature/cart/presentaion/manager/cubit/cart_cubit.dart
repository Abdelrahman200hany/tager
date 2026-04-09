import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tager/core/entity/product_entity.dart';
import 'package:tager/feature/cart/data/cart_entity.dart';
import 'package:tager/feature/cart/data/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  // next set this list must be local storage
  CartEntity cartEntity = CartEntity(cartItemList: []);

  void addProduct(ProductEntity product) {
    // if product found icrease the counter

    bool isProductExits = cartEntity.isExits(product);

    CartItemEntity cartItem = cartEntity.getCartItem(product);
    if (isProductExits) {
      cartItem.incrementCounter();
    } else {
      cartEntity.addItem(cartItem);
    }

    // if product not found add new one

    emit(CartAdded());
  }

  void deleteCartItem(CartItemEntity item) {
    cartEntity.deleteItem(item);
    emit(CartDeleted());
  }
}
