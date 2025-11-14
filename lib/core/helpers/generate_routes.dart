import 'package:flutter/material.dart';
import 'package:tager/feature/Splash_feature/data/presention/views/splash_view.dart';
import 'package:tager/feature/onBoarding_feature/presentaion/views/on_Boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
       case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
