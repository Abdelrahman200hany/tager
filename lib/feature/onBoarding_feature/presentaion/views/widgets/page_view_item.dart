import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/servies/shared_preferense_singleton.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/feature/auth_feature/presentaion/views/auth_view.dart';
import 'package:tager/feature/onBoarding_feature/data/models/onboading_view_item_model.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.item, required this.index});
  final OnboadingViewItemModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: double.infinity,

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(item.backGroundImage, fit: BoxFit.fill),
          ),
          SvgPicture.asset(item.imageLoge),

          Positioned(
            top: 10,
            right: 10,
            child: Visibility(
              visible: index == 0,

              child: TextButton(
                onPressed: () {
                  Prefs.setBool(kOnBoadrdingViewSeen, true);
                  Navigator.pushReplacementNamed(context, AuthView.routeName);
                },
                child: Text('تخط', style: AppStyle.styleSemiBold13(context)),
              ),
            ),
          ),

          // index == 0
          //     ? Positioned(
          //         top: 10,
          //         right: 10,
          //         child: TextButton(
          //           onPressed: () {
          //             Navigator.pushNamed(context, AuthView.routeName);
          //           },
          //           child: Text(
          //             'تخط',
          //             style: AppStyle.styleSemiBold13(context),
          //           ),
          //         ),
          //       )
          //     : SizedBox(),
        ],
      ),
    );
  }
}
