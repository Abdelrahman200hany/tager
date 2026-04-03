import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/servies/create_singleton_servies_locator.dart';
import 'package:tager/feature/auth_feature/domain/repos/auth_repo.dart';
import 'package:tager/feature/auth_feature/presentaion/manager/auth_cubit/sign_up/sign_up_cubit.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/sign_up_view_body_bloc_builder.dart';

class SignUPView extends StatelessWidget {
  const SignUPView({super.key});
  static const String routeName = 'SignUPView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreateUserWithEmailAndPasswordCubit(getIt.get<AuthRepo>()),
      child:const SingUpViewBodyBlocBuilder(),
    );
  }
}
