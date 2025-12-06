import 'package:firebase_auth/firebase_auth.dart';
import 'package:tager/feature/auth_feature/domain/entity/user_entity.dart';

class UserModel  extends UserEntity{
  UserModel({required super.name, required super.id, required super.email});

  factory UserModel.fromFirebaseUser(User user){
    return UserModel(
      name: user.displayName ?? '',
      id: user.uid,
      email: user.email ?? '',
    );
  }
}