
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/helpers/show_snack_bar.dart';
import 'package:tager/feature/auth_feature/presentaion/manager/auth_cubit/sign_in/sign_in_cubit.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/sign_in_view_body.dart';
import 'package:tager/feature/main_view/presentation/views/main_view.dart';

class SignInBlocBuilder extends StatelessWidget {
  const SignInBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          showSnackBarMessage(context, 'تم تسجيل الدخول بنجاح');
          Navigator.pushNamed(context, MainView.routeName);
        } else if (state is SignInFailureState) {
          showSnackBarMessage(context, state.errormessage);
        }
      },
      builder: (context, state) {
        return SignInViewBody(
          isLoading: state is SignInLoadingState ? true : false,
        );
      },
    );
  }
}
