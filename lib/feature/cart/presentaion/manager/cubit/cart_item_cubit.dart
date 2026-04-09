import 'package:bloc/bloc.dart';
import 'package:tager/feature/cart/data/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void cartItemUPdate(CartItemEntity cartitem) {
    emit(CartItemUpdate(cartItemEntity:  cartitem));
  }
}
