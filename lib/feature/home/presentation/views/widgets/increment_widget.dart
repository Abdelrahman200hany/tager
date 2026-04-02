import 'package:flutter/material.dart';
import 'package:tager/core/uitls/app_color.dart';

class IncrementWidget extends StatelessWidget {
  const IncrementWidget({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        color: AppColor.kPrimaryColorLight,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Center(child: Icon(Icons.add, color: Colors.white)),
      ),
    );
  }
}