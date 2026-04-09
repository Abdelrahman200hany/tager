import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/feature/cart/presentaion/manager/cubit/cart_cubit.dart';
import 'package:tager/feature/main_view/presentation/views/widgets/main_view_body_bloc_bulider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName = 'MainView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MainViewBodyBlocBuilder(),
    );
  }
}
