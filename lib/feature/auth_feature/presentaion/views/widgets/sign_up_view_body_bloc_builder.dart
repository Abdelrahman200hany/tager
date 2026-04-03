
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/helpers/show_snack_bar.dart';
import 'package:tager/feature/auth_feature/presentaion/manager/auth_cubit/sign_up/sign_up_cubit.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/sign_up_view_body.dart';

class SingUpViewBodyBlocBuilder extends StatelessWidget {
  const SingUpViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
