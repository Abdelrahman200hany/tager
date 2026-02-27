import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/servies/firebase_auth_serviecs.dart';
import 'package:tager/core/servies/firestore_services.dart';
import 'package:tager/core/servies/shared_preferense_singleton.dart';
import 'package:tager/core/uitls/backend_endpoint.dart';
import 'package:tager/errors/custom_expetion.dart';
import 'package:tager/errors/failure.dart';
import 'package:tager/feature/auth_feature/data/models/user_model.dart';
import 'package:tager/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:tager/feature/auth_feature/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServiecs firebaseAuthServies;
  final FireStoreServices firestore;

  AuthRepoImpl(this.firebaseAuthServies, this.firestore);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthServies.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, uId: user.uid, email: email);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomExpetion catch (e) {
      await deleteUser(user);

      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);

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
      var userEntity = await readUserData(userID: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExpetion catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('the error in AuthRepoImpl.signinWithEmailAndPasswordis $e');

      return left(ServerFailure(message: 'حدث خطأ ما حاول مره اخري'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServies.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user);
      bool userDataExits = await firestore.chekedDataIfExits(
        deumentID: userEntity.uId,
        path: BackEndEndPoint.checkIfUserIsExits,
      );

      if (userDataExits) {
        await readUserData(userID: userEntity.uId);
        await saveUserData(user: userEntity);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);

      log('the error in AuthRepoImpl.signinWithGoogle is $e');

      return left(ServerFailure(message: 'حدث خطأ ما حاول مره اخري'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServies.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      bool userDataExits = await firestore.chekedDataIfExits(
        deumentID: userEntity.uId,
        path: BackEndEndPoint.checkIfUserIsExits,
      );

      if (userDataExits) {
        await readUserData(userID: userEntity.uId);
        await saveUserData(user: userEntity);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('the error in AuthRepoImpl.signInWithFacebook is $e');
      return left(
        ServerFailure(message: 'لقد جدث خطا ما الرجاء المحاوله في وثت لاحق'),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServies.deletedUser();
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await firestore.addData(
      documentID: user.uId,
      path: BackEndEndPoint.addUserCollention,
      data: UserModel.fromEntity(user).toMap(),
    );
  }

  @override
  Future<UserEntity> readUserData({required String userID}) async {
    var userdata = await firestore.readData(
      documentID: userID,
      path: BackEndEndPoint.readUserCollention,
    );
    //  to convert the map in dataBase to UserModel
    return UserModel.fromjeson(userdata);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var userData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kPUserDataSaved, userData);
  }
}
