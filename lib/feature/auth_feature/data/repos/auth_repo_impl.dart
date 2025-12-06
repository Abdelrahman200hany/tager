import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tager/core/servies/firebase_auth_serviecs.dart';
import 'package:tager/errors/custom_expetion.dart';
import 'package:tager/errors/failure.dart';
import 'package:tager/feature/auth_feature/data/models/user_model.dart';
import 'package:tager/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:tager/feature/auth_feature/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServiecs firebaseAuthServies;

  AuthRepoImpl(this.firebaseAuthServies);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var User = await firebaseAuthServies.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(User));
    } on CustomExpetion catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('the error in AuthRepoImpl.createUserWithEmailAndPassword is $e');
      return left(ServerFailure(message: 'حدث خطأ ما حاول مره اخري'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthServies.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomExpetion catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
            log('the error in AuthRepoImpl.signinWithEmailAndPasswordis $e');

      return left(ServerFailure(message: 'حدث خطأ ما حاول مره اخري'));
    }
  }
  
//   @override
//   Future<Either<Failure, UserEntity>> signinWithGoogle() async{

// try{



// }
// catch(e){

//   return left(ServerFailure(message: 'حدث خطأ ما حاول مره اخري'));
// }
 
//   }
}
