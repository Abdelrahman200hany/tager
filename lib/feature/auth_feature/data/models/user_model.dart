import 'package:firebase_auth/firebase_auth.dart';
import 'package:tager/feature/auth_feature/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.uId, required super.email});

//convert the firebase user to Custom user model
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      uId: user.uid,
      email: user.email ?? '',
    );
  }

// covert the map from database to user model
   factory UserModel.fromjeson(jeson ) {
    return UserModel(
      name:jeson['name'],
      uId: jeson['id'],
      email: jeson['email'],
    );
  }

factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      uId: userEntity.uId,
      email: userEntity.email,
    );
  }

// convert the user model to map to save it in database
  
  toMap() {
    return {'name': name, 'id': uId, 'email': email};
  }

}
