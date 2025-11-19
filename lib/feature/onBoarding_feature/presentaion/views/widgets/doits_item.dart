import 'package:flutter/material.dart';

class DoitsItem extends StatelessWidget {
  const DoitsItem({super.key, required this.currentPageIndex});
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 30),

      height: 11,
      width: 11,

      decoration: BoxDecoration(
        color: currentPageIndex == 0 || currentPageIndex == 1
            ? const Color(0xff1B5E37)
            : const Color(0xff5DB957).withValues(alpha: 0.5),

        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
