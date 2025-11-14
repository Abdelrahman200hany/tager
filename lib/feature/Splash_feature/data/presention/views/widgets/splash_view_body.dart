import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tager/core/uitls/Assets.dart';
import 'package:tager/feature/onBoarding_feature/presentaion/views/on_Boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    splahNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              Assets.assetsImagesPlant,
              fit: BoxFit.scaleDown,
            ),
          ),

          ZoomIn(
            duration: Duration(seconds: 4),
            child: Center(
              child: SizedBox(
                child: SvgPicture.asset(
                  Assets.assetsImagesLogo,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: SvgPicture.asset(
              Assets.assetsImagesSplashBottom,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  void splahNavigate() {
    Future.delayed(
      Duration(seconds: 4, milliseconds: 30),
      () => Navigator.pushReplacementNamed(context, OnBoardingView.routeName),
    );
  }
}
