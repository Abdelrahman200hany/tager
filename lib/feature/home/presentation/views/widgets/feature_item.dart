
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as Svg;
import 'package:tager/core/uitls/app_color.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/core/uitls/assets.dart';
import 'package:tager/core/widgets/custom_text_bottom_with_background.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AspectRatio(
      aspectRatio: 342 / 158,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: screenWidth * 0.4,
              child: SizedBox(
                child: SvgPicture.asset(
                  Assets.assetsImageOnBording1,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: screenWidth * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Svg.Svg(Assets.assetsImageFeatureOverGround),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right:8 ),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      Text(
                        'عروض العيد',
                        style: AppStyle.styleSRegular13(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        'خصم 25%',
                        style: AppStyle.styleBold19(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        // height: 32,
                        width: 116,
                        child: CustomTextBottomWithBackground(
                          text: 'تسوق الان',
                          textColor: AppColor.kPrimaryColor,
                          backGroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 28),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
