import 'package:flutter/material.dart';
import 'package:tager/core/helpers/generate_routes.dart';
import 'package:tager/feature/Splash_feature/data/presention/views/splash_view.dart';

void main() {
  runApp(const Tager());
}

class Tager extends StatelessWidget {
  const Tager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      onGenerateRoute:onGenerateRoute ,
      initialRoute: SplashView.routeName,
    );
  }
}