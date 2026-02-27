import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tager/feature/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:tager/feature/auth_feature/domain/entity/user_entity.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepoImpl) : super(SignInInitialState());

  final AuthRepoImpl authRepoImpl;

  Future<void> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    var result = await authRepoImpl.signinWithEmailAndPassword(
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
    var result = await authRepoImpl.signinWithGoogle();
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
    var result = await authRepoImpl.signInWithFacebook();

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
