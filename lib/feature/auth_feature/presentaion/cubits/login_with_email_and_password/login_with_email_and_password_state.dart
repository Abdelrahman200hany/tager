part of 'login_with_email_and_password_cubit.dart';

@immutable
sealed class LoginWithEmailAndPasswordState {}

final class LoginWithEmailAndPasswordInitial
    extends LoginWithEmailAndPasswordState {}

final class LoginWithEmailAndPasswordLoadingState
    extends LoginWithEmailAndPasswordState {}

final class LoginWithEmailAndPasswordFSuccessState
    extends LoginWithEmailAndPasswordState {
  final UserEntity userEntity;
  LoginWithEmailAndPasswordFSuccessState({required this.userEntity});
}

final class LoginWithEmailAndPasswordFailureState
    extends LoginWithEmailAndPasswordState {
  final String errormessage;
  LoginWithEmailAndPasswordFailureState({required this.errormessage});
}
