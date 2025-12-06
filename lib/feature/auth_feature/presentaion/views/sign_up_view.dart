import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/helpers/show_snack_bar.dart';
import 'package:tager/core/servies/create_singleton_servies_locator.dart';
import 'package:tager/feature/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:tager/feature/auth_feature/presentaion/cubits/create_user_with_email_and_password/create_user_with_email_and_password_cubit.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/sign_up_view_body.dart';

class SignUPView extends StatelessWidget {
  const SignUPView({super.key});
  static const String routeName = 'SignUPView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreateUserWithEmailAndPasswordCubit(getIt.get<AuthRepoImpl>()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<
            CreateUserWithEmailAndPasswordCubit,
            CreateUserWithEmailAndPasswordState
          >(
            listener: (context, state) {
              if (state is CreateUserWithEmailAndPasswordfailureState) {
                showSnackBarMessage(context, state.errormessage);
              } else if (state is CreateUserWithEmailAndPasswordSuccessState) {
                showSnackBarMessage(context, 'تم إنشاء الحساب بنجاح');
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return SignUPViewBody(
                isLoadingState:
                    state is CreateUserWithEmailAndPasswordLoadingState
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
