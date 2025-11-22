import 'package:flutter/material.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/auth_veiw_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static const String routeName = 'authview';
  @override
  Widget build(BuildContext context) {
    return AuthViewBody();
  }
}

