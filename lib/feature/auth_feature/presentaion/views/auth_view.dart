import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static const String routeName = 'authview';
  @override
  Widget build(BuildContext context) {
    return AuthViewBody();
  }
}

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
