import 'package:flutter/material.dart';
import 'package:tager/feature/home/presentation/views/widgets/product_item.dart';

class ProductitemList extends StatelessWidget {
  const ProductitemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 160 / 210,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => ProductItem(),
    );
  }
}