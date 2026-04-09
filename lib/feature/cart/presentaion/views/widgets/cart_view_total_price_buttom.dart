import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/widgets/custom_text_bottom_with_background.dart';
import 'package:tager/feature/cart/presentaion/manager/cubit/cart_cubit.dart';
import 'package:tager/feature/cart/presentaion/manager/cubit/cart_item_cubit.dart';

class CartViewTotalPriceButtom extends StatelessWidget {
  const CartViewTotalPriceButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomTextBottomWithBackground(
          text:
              'الدفع ${context.watch<CartCubit>().cartEntity.calTotalPrice()} جنية',
        );
      },
    );
  }
}
