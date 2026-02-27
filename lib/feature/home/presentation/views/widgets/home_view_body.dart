import 'package:flutter/material.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:tager/feature/home/presentation/views/widgets/fake_app_bar.dart';
import 'package:tager/feature/home/presentation/views/widgets/feature_list.dart';
import 'package:tager/feature/home/presentation/views/widgets/header_top_line.dart';
import 'package:tager/feature/search/presentation/views/search_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: CustomScrollView(
          slivers: [
            CustomHomeSliverAppBar(),
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
                padding: EdgeInsets.only(top: 18),
                child: FeatureList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 18),
                child: HeaderTopline(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
