import 'package:flutter/material.dart';
import 'package:tager/feature/Splash_feature/data/presention/views/splash_view.dart';
import 'package:tager/feature/auth_feature/presentaion/views/auth_view.dart';
import 'package:tager/feature/auth_feature/presentaion/views/create_new_password_view.dart';
import 'package:tager/feature/auth_feature/presentaion/views/forget_password_view.dart';
import 'package:tager/feature/auth_feature/presentaion/views/otp_view.dart';
import 'package:tager/feature/auth_feature/presentaion/views/sign_up_view.dart';
import 'package:tager/feature/onBoarding_feature/presentaion/views/on_Boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case AuthView.routeName:
      return MaterialPageRoute(builder: (context) => const AuthView());
    case SignUPView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUPView());
    case ForgetPassWordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPassWordView(),
      );
    case OtpView.routeName:
      return MaterialPageRoute(builder: (context) => const OtpView());
    case CreateNewPasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateNewPasswordView(),
      );

    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
