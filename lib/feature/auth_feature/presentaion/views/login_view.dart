import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/helpers/show_snack_bar.dart';
import 'package:tager/core/servies/create_singleton_servies_locator.dart';
import 'package:tager/feature/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:tager/feature/auth_feature/presentaion/cubits/login_with_email_and_password/login_with_email_and_password_cubit.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginWithEmailAndPasswordCubit(getIt.get<AuthRepoImpl>()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<
            LoginWithEmailAndPasswordCubit,
            LoginWithEmailAndPasswordState
          >(
            listener: (context, state) {
              if (state is LoginWithEmailAndPasswordFSuccessState) {
                showSnackBarMessage(context, 'تم تسجيل الدخول بنجاح');
              } else if (state is LoginWithEmailAndPasswordFailureState) {
                showSnackBarMessage(context, state.errormessage);
              }
            },
            builder: (context, state) {
              return LoginViewBody(
                isLoading: state is LoginWithEmailAndPasswordLoadingState
                    ? true
                    : false,
              );
            },
          );
        },
      ),
    );
  }
}
