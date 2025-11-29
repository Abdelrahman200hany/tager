import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tager/core/uitls/app_style.dart';

class CustomHaveOrCreateNewAcountTextWidget extends StatelessWidget {
  const CustomHaveOrCreateNewAcountTextWidget({
    super.key,
    this.onTap,
    required this.fristText,
    required this.secondText,
  });

  final void Function()? onTap;
  final String fristText, secondText;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: fristText,
        style: AppStyle.styleBold16(
          context,
        ).copyWith(color: const Color(0xff949D9E)),
        children: [
          TextSpan(
            text: secondText,
            style: AppStyle.styleBold16(
              context,
            ).copyWith(color: const Color(0xff1B5E37)),
            recognizer: TapGestureRecognizer()..onTap=onTap,
          ),
        ],
      ),
    );
  }
}
