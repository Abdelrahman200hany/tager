import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/feature/cart/presentaion/manager/cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 36,
        width: double.infinity,
        decoration: BoxDecoration(color: const Color(0xFFEBF9F1)),
        child: Center(
          child: Text(
            'لديك منتجات ${context.watch<CartCubit>().cartEntity.cartItemList.length} في سله التسوق',
            style: AppStyle.styleSRegular13(
              context,
            ).copyWith(color: const Color(0xFF1B5E37) /* Green1-500 */),
          ),
        ),
      ),
    );
  }
}
