import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tager/core/cubits/product_Cubit/product_cubit.dart';
import 'package:tager/core/helpers/get_dummy_products.dart';
import 'package:tager/feature/home/presentation/views/widgets/product_item_list.dart';

class ProducItemListBlocBuilder extends StatelessWidget {
  const ProducItemListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return ProductitemList(products: state.products);
        } else if (state is ProductFailure) {
         return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return Skeletonizer.sliver(
            child: ProductitemList(products: dummyProducts),
          );
        }
      },
    );
  }
}
