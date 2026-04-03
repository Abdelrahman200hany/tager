import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tager/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:tager/feature/auth_feature/domain/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitialState());

  final AuthRepo authRepo;

  Future<void> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    var result = await authRepo.signinWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(SignInFailureState(errormessage: failure.message));
      },
      (userEntity) {
        emit(SignInSuccessState(userEntity: userEntity));
      },
    );
  }

  Future<void> signinWithGoogle() async {
    emit(SignInLoadingState());
    var result = await authRepo.signinWithGoogle();
    result.fold(
      (failure) {
        emit(SignInFailureState(errormessage: failure.message));
      },
      (userEntity) {
        emit(SignInSuccessState(userEntity: userEntity));
      },
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoadingState());
    var result = await authRepo.signInWithFacebook();

    result.fold(
      (faulire) {
        emit(SignInFailureState(errormessage: faulire.message));
      },
      (userEntity) {
        emit(SignInSuccessState(userEntity: userEntity));
      },
    );
  }
}
