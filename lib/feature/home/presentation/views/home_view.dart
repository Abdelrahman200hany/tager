import 'package:flutter/widgets.dart';
import 'package:tager/feature/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return const HomeViewBody();
  }
}
