part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitialState
    extends SignInState {}

final class SignInLoadingState
    extends SignInState {}

final class SignInSuccessState
    extends SignInState {
  final UserEntity userEntity;
  SignInSuccessState({required this.userEntity});
}

final class SignInFailureState
    extends SignInState {
  final String errormessage;
  SignInFailureState({required this.errormessage});
}
