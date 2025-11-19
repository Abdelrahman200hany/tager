import 'package:flutter/material.dart';
import 'package:tager/core/uitls/app_style.dart';

class CustomTextBottom extends StatelessWidget {
  const CustomTextBottom({super.key, this.ontap, required this.text});
  final void Function()? ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xff1B5E37),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Text(text, style: AppStyle.styleSemiBold16(context)),
        ),
      ),
    );
  }
}
