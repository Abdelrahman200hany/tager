import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/cubits/product_Cubit/product_cubit.dart';
import 'package:tager/core/widgets/custom_app_bar.dart';
import 'package:tager/feature/home/presentation/views/widgets/fake_app_bar.dart';
import 'package:tager/feature/home/presentation/views/widgets/header_top_line.dart';
import 'package:tager/feature/home/presentation/views/widgets/product_item_list_bloc_builder.dart';
import 'package:tager/feature/search/presentation/views/search_view.dart';

class CatogryViewBody extends StatefulWidget {
  const CatogryViewBody({super.key});

  @override
  State<CatogryViewBody> createState() => _CatogryViewBodyState();
}

class _CatogryViewBodyState extends State<CatogryViewBody> {
  @override
  void initState() {
    super.initState();

    context.read<ProductCubit>().getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(title: 'التصنيفات'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsGeometry.only(top: 18),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SearchView.routeName);
                  },
                  child: FakeCustomSearchBar(),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 18, bottom: 18),
                child: HeaderTopline(),
              ),
            ),
            ProducItemListBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
