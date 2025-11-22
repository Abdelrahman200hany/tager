
import 'package:flutter/material.dart';
import 'package:tager/core/uitls/app_style.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: const Color(0xffDDDFDF))),
        SizedBox(width: 18),
        Text(
          'أو',
          style: AppStyle.styleSemiBold16(
            context,
          ).copyWith(color: const Color(0xff0C0D0D)),
        ),
        SizedBox(width: 18),
        Expanded(child: Divider(color: const Color(0xffDDDFDF))),
      ],
    );
  }
}
