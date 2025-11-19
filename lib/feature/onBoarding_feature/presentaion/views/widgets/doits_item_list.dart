import 'package:flutter/material.dart';
import 'package:tager/feature/onBoarding_feature/presentaion/views/widgets/doits_item.dart';

class DoitsList extends StatelessWidget {
  const DoitsList({super.key, required this.currentPageIndex});
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        2,
        (index) => Padding(
          padding: EdgeInsetsGeometry.only(right: 8),
          child: DoitsItem(currentPageIndex: currentPageIndex),
        ),
      ),
    );
  }
}
