import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/helpers/show_snack_bar.dart';
import 'package:tager/feature/cart/presentaion/manager/cubit/cart_cubit.dart';
import 'package:tager/feature/main_view/presentation/views/widgets/main_view_body.dart';

class MainViewBodyBlocBuilder extends StatelessWidget {
  const MainViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAdded) {
          showSnackBarMessage(context, 'لقد تم اضافه المنتج بنجاح ');
        }
        if (state is CartDeleted) {
          showSnackBarMessage(context, 'لقد تم حدق المنتج ب نجاح');
        }
      },
      child: const MainViewBody(),
    );
  }
}
