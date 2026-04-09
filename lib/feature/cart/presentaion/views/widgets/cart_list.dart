import 'package:flutter/material.dart';
import 'package:tager/feature/cart/data/cart_item_entity.dart';
import 'package:tager/feature/cart/presentaion/views/widgets/cart_item.dart';

class Cartlist extends StatelessWidget {
  const Cartlist({super.key, required this.items});
  final List<CartItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => CartItem(item: items[index]),
      separatorBuilder: (context, index) =>
          Divider(color: Colors.grey, height: 20),
      itemCount: items.length,
    );
  }
}
