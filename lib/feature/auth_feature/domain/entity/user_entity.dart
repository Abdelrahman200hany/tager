class UserEntity {
  final String name, uId, email;
  UserEntity({required this.name, required this.uId, required this.email});



  // factory UserEntity.fromFirebase(User user){

  //   return UserEntity(
  //     name: user.displayName ?? '',
  //     id: user.uid,
  //     email: user.email ?? '',
  //   );
  // }
}
