import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tager/errors/custom_expetion.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthServiecs {
  Future  <void>deletedUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'the error code in FirebaseAuthServiecs.createUserWithEmailAndPassword $e of type ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomExpetion(message: 'كلمه المرور ضعيفه جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExpetion(message: ' الايميل مستخدم بالفعل ');
      } else if (e.code == 'invalid-email') {
        throw CustomExpetion(message: 'الايميل غير صالح');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomExpetion(message: 'عمليه انشاء الحساب غير مسموحه حاليا');
      } else if (e.code == 'user-disabled') {
        throw CustomExpetion(message: 'تم تعطيل هذا المستخدم');
      } else if (e.code == 'user-not-found') {
        throw CustomExpetion(message: 'المستخدم غير موجود');
      } else if (e.code == 'too-many-requests') {
        throw CustomExpetion(message: 'تم ارسال العديد من الطلبات حاول لاحقا');
      } else if (e.code == 'network-request-failed') {
        throw CustomExpetion(message: 'لا يوجد اتصال بالانترنت');
      } else if (e.code == 'network-error') {
        throw CustomExpetion(message: 'لا يوجد اتصال بالانترنت');
      } else if (e.code == 'unknown') {
        throw CustomExpetion(message: 'حدث خطأ ما حاول مره اخري');
      } else {
        throw CustomExpetion(message: 'حدث خطأ ما حاول مره اخري');
      }
    } catch (e) {
      log(
        'the error in FirebaseAuthServiecs.createUserWithEmailAndPassword is $e',
      );
      throw CustomExpetion(message: 'حدث خطأ ما حاول مره اخري');
    }
  }

  // login with email and passwrd method
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'the error code in FirebaseAuthServiecs.signInWithEmailAndPassword $e ofType ${e.code}',
      );

      if (e.code == 'invalid-email') {
        throw CustomExpetion(message: 'الايميل غير صالح');
      } else if (e.code == 'user-not-found') {
        throw CustomExpetion(message: 'المستخدم غير موجود');
      } else if (e.code == 'invalid-credential') {
        throw CustomExpetion(
          message: 'البريد الالكتروني او كلمه المرور غير صحيحه',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomExpetion(message: 'كلمه المرور غير صحيحه');
      } else if (e.code == 'too-many-requests') {
        throw CustomExpetion(message: 'تم ارسال العديد من الطلبات حاول لاحقا');
      } else if (e.code == 'network-request-failed') {
        throw CustomExpetion(message: 'لا يوجد اتصال بالانترنت');
      } else if (e.code == 'network-error') {
        throw CustomExpetion(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomExpetion(message: 'حدث خطأ ما حاول مره اخري');
      }
    } catch (e) {
      log('the error in FirebaseAuthServiecs.signInWithEmailAndPassword is $e');

      throw CustomExpetion(message: 'حدث خطأما حاول مره اخري');
    }
  }

  Future<User> signInWithGoogle() async {
    // to open dailog to choose google account
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // if(googleUser == null){
    //   return;
    // }

    //  get the authentication object carry tokens  to provide to firebase
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // the main method in fire base
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  bool isSignedIn() {
     log(
        'the error code in FirebaseAuthServiecs.isSignedIn ',
      );
    return FirebaseAuth.instance.currentUser != null;
  }
}
