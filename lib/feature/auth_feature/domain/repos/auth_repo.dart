import 'package:dartz/dartz.dart';
import 'package:tager/errors/failure.dart';
import 'package:tager/feature/auth_feature/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
   Future<Either<Failure, UserEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,

  });

  // Future <Either <Failure,UserEntity>> signinWithGoogle();
}
