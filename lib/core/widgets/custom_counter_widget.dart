import 'package:flutter/material.dart';
import 'package:tager/core/uitls/app_color.dart';

class CustomCounterWidget extends StatelessWidget {
  const CustomCounterWidget({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: AppColor.kPrimaryColorLight,
        shape: BoxShape.circle,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: GestureDetector(
          onTap: onPressed,
          child: Center(child: Icon(icon, color: Colors.white)),
        ),
      ),
    );
  }
}
