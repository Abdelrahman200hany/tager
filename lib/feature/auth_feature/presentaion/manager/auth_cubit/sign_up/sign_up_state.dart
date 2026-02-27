part of 'sign_up_cubit.dart';

@immutable
sealed class CreateUserWithEmailAndPasswordState {}

final class CreateUserWithEmailAndPasswordInitial extends CreateUserWithEmailAndPasswordState {}
final class CreateUserWithEmailAndPasswordLoadingState extends CreateUserWithEmailAndPasswordState {}
final class CreateUserWithEmailAndPasswordSuccessState extends CreateUserWithEmailAndPasswordState {
  final UserEntity userEntity;
  CreateUserWithEmailAndPasswordSuccessState({required this.userEntity});
}
final class CreateUserWithEmailAndPasswordfailureState extends CreateUserWithEmailAndPasswordState {

  final String errormessage;
  CreateUserWithEmailAndPasswordfailureState({required this.errormessage});
}
