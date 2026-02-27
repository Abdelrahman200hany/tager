
import 'package:flutter/material.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/core/widgets/custom_text_bottom.dart';

class HeaderTopline extends StatelessWidget {
  const HeaderTopline({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          style: AppStyle.styleBold13(
            context,
          ).copyWith(color:const  Color(0xFF0C0D0D)),
        ),
        Spacer(),
        CustomTextBottom(text: 'المزيد', textColor: const Color(0xFF949D9E)),
      ],
    );
  }
}
