import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/core/uitls/assets.dart';

class FakeCustomSearchBar extends StatelessWidget {
  const FakeCustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black.withValues(alpha: 0.2),

      elevation: 1.5,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            Text('ابحث عن.......', style: AppStyle.styleSRegular13(context)),
            Spacer(),
            SvgPicture.asset(Assets.assetsImageFiltering),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
