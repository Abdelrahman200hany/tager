import 'package:flutter/material.dart';
import 'package:tager/core/uitls/app_style.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  const customAppBar({
    super.key,
    required this.title,
    this.wantedIconBack = false,
  });
  final String title;
  final bool wantedIconBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: wantedIconBack
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : SizedBox(),
      title: Text(
        title,
        style: AppStyle.styleBold19(
          context,
        ).copyWith(color: const Color(0xFF0C0D0D)),
      ),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
