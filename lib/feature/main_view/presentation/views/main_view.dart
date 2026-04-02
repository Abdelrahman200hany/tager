import 'package:flutter/material.dart';
import 'package:tager/feature/main_view/presentation/views/widgets/main_view_body.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName='MainView';

  @override
  Widget build(BuildContext context) {
    return const MainViewBody();
  }
}