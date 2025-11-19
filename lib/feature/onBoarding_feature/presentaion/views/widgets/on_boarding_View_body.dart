import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/servies/shared_Preferense_singleton.dart';
import 'package:tager/core/uitls/app_color.dart';
import 'package:tager/feature/auth_feature/presentaion/views/auth_view.dart';
import 'package:tager/feature/onBoarding_feature/presentaion/views/widgets/custom_text_bottom.dart';
import 'package:tager/feature/onBoarding_feature/presentaion/views/widgets/expanded_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  int currentPageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ExpandedPageView(pageController: pageController),
            Spacer(),
            // Center(child: DoitsList(currentPageIndex: currentPageIndex)),
            Center(
              child: DotsIndicator(
                dotsCount: 2,
                decorator: DotsDecorator(
                  activeColor: AppColor.kPrimaryColor,
                  color: currentPageIndex == 1
                      ? AppColor.kPrimaryColor
                      : AppColor.kPrimaryColor.withValues(alpha: 0.5),
                ),
              ),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: currentPageIndex == 1 ? true : false,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: CustomTextBottom(
                  text: ' أبدا الان',
                  ontap: () {
                    Prefs.setBool(kOnBoadrdingViewSeen, true);
                    Navigator.pushReplacementNamed(context, AuthView.routeName);
                  },
                ),
              ),
            ),
            // currentPageIndex == 1
            //     ? Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 40),
            //         child: CustomTextBottom(
            //           text: 'ابدا الان ',
            //           ontap: () {
            //             Navigator.pushNamed(context, AuthView.routeName);
            //           },
            //         ),
            //       )
            //     : SizedBox(),
            Flexible(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}
