import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/widgets/custom_app_bar.dart';
import 'package:tager/feature/cart/presentaion/manager/cubit/cart_cubit.dart';
import 'package:tager/feature/cart/presentaion/views/widgets/cart_header.dart';
import 'package:tager/feature/cart/presentaion/views/widgets/cart_list.dart';
import 'package:tager/feature/cart/presentaion/views/widgets/cart_view_total_price_buttom.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(title: 'السلة'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),

        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: const SizedBox(height: 24)),
                CartHeader(),
                SliverToBoxAdapter(child: const SizedBox(height: 24)),

                Cartlist(
                  items: context.watch<CartCubit>().cartEntity.cartItemList,
                ),
              ],
            ),
            Positioned(
              bottom: 46,
              left: 0,
              right: 0,
              child: CartViewTotalPriceButtom(),
            ),
          ],
        ),
      ),
    );
  }
}
