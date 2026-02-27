import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tager/core/uitls/assets.dart';

class NoticationIconBottom extends StatelessWidget {
  const NoticationIconBottom({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      width: 33,
      decoration: ShapeDecoration(
        color: const Color(0xFFEEF8ED),
        shape: OvalBorder(),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(Assets.assetsImageClock),
        ),
      ),
    );
  }
}
