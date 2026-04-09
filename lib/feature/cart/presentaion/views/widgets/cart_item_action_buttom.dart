import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/core/widgets/custom_counter_widget.dart';
import 'package:tager/feature/cart/data/cart_item_entity.dart';
import 'package:tager/feature/cart/presentaion/manager/cubit/cart_item_cubit.dart';

class CartItemActionButtoms extends StatelessWidget {
  const CartItemActionButtoms({super.key, required this.item});

  final CartItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCounterWidget(
          icon: Icons.remove,
          onPressed: () {
            item.decrementCounter();
            context.read<CartItemCubit>().cartItemUPdate(item);
          },
        ),
        SizedBox(width: 8),
        Text(item.counter.toString(), style: AppStyle.styleSemiBold18(context)),
        SizedBox(width: 8),
        CustomCounterWidget(
          icon: Icons.add,
          onPressed: () {
            item.incrementCounter();
            context.read<CartItemCubit>().cartItemUPdate(item);
          },
        ),
      ],
    );
  }
}
