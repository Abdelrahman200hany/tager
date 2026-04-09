import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/uitls/app_color.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/core/uitls/assets.dart';
import 'package:tager/feature/cart/data/cart_item_entity.dart';
import 'package:tager/feature/cart/presentaion/manager/cubit/cart_cubit.dart';
import 'package:tager/feature/cart/presentaion/manager/cubit/cart_item_cubit.dart';
import 'package:tager/feature/cart/presentaion/views/widgets/cart_item_action_buttom.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.item});
  final CartItemEntity item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdate) {
          if (current.cartItemEntity == item) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 72,
              height: 86,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(Assets.assetsImageMyphoto),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.productEntity.productName,
                  style: AppStyle.styleBold19(context),
                ),
                SizedBox(height: 6),
                Text(
                  ' ${item.calCulatetotalweight()} كيلو',
                  style: AppStyle.styleSRegular16(
                    context,
                  ).copyWith(color: AppColor.kSecondyColorLight),
                ),
                SizedBox(height: 6),
                CartItemActionButtoms(item: item),
              ],
            ),
            Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 6),
                GestureDetector(
                  onTap: () {
                    context.read<CartCubit>().deleteCartItem(item);
                  },
                  child: Icon(Icons.delete, color: Colors.redAccent),
                ),
                SizedBox(height: 38),

                Text(
                  '${item.calCulatetotalPrice()} جنية',
                  style: AppStyle.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColor.kSecondyColorLight),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
