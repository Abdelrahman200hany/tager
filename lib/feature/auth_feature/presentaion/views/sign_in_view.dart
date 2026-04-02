import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/servies/create_singleton_servies_locator.dart';
import 'package:tager/feature/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:tager/feature/auth_feature/presentaion/manager/auth_cubit/sign_in/sign_in_cubit.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/sign_in_bloc_builder.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepoImpl>()),
      child:  SignInBlocBuilder(),
    );
  }
}
