import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tager/feature/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:tager/feature/auth_feature/domain/entity/user_entity.dart';

part 'create_user_with_email_and_password_state.dart';

class CreateUserWithEmailAndPasswordCubit
    extends Cubit<CreateUserWithEmailAndPasswordState> {
  CreateUserWithEmailAndPasswordCubit( this.authRepoImpl)
    : super(CreateUserWithEmailAndPasswordInitial());
  final AuthRepoImpl authRepoImpl;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(CreateUserWithEmailAndPasswordLoadingState());
    var result = await authRepoImpl.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) {
        emit(
          CreateUserWithEmailAndPasswordfailureState(
            errormessage: failure.message,
          ),
        );
      },
      (userEntity) {
        emit(
          CreateUserWithEmailAndPasswordSuccessState(userEntity: userEntity),
        );
      },
    );
  }
}
