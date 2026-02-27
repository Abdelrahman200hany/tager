import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/helpers/show_snack_bar.dart';
import 'package:tager/core/servies/create_singleton_servies_locator.dart';
import 'package:tager/feature/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:tager/feature/auth_feature/presentaion/manager/auth_cubit/sign_in/sign_in_cubit.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/sign_in_view_body.dart';
import 'package:tager/feature/home/presentation/views/home_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepoImpl>()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state is SignInSuccessState) {
                showSnackBarMessage(context, 'تم تسجيل الدخول بنجاح');
                Navigator.pushNamed(context, HomeView.routeName);
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
        },
      ),
    );
  }
}
