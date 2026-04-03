import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tager/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:tager/feature/auth_feature/domain/repos/auth_repo.dart';

part 'sign_up_state.dart';

class CreateUserWithEmailAndPasswordCubit
    extends Cubit<CreateUserWithEmailAndPasswordState> {
  CreateUserWithEmailAndPasswordCubit(this.authRepo)
    : super(CreateUserWithEmailAndPasswordInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(CreateUserWithEmailAndPasswordLoadingState());
    var result = await authRepo.createUserWithEmailAndPassword(
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
