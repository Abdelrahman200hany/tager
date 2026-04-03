import 'package:flutter/material.dart';
import 'package:tager/core/entity/product_entity.dart';
import 'package:tager/feature/home/presentation/views/widgets/product_item.dart';

class ProductitemList extends StatelessWidget {
  const ProductitemList({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 160 / 210,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductItem(item: products[index]),
    );
  }
}
