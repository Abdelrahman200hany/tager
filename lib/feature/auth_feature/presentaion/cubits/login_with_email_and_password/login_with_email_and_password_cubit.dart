import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tager/feature/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:tager/feature/auth_feature/domain/entity/user_entity.dart';

part 'login_with_email_and_password_state.dart';

class LoginWithEmailAndPasswordCubit extends Cubit<LoginWithEmailAndPasswordState> {
  LoginWithEmailAndPasswordCubit(this.authRepoImpl) : super(LoginWithEmailAndPasswordInitial());

  final AuthRepoImpl authRepoImpl ;

  Future<void>signinWithEmailAndPassword({required String email , required String password}) async {
    emit(LoginWithEmailAndPasswordLoadingState());
    var result = await authRepoImpl.signinWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(
          LoginWithEmailAndPasswordFailureState(
            errormessage: failure.message,
          ),
        );
      },
      (userEntity) {
        emit(
          LoginWithEmailAndPasswordFSuccessState(userEntity: userEntity),
        );
      },
    );
  }
}
