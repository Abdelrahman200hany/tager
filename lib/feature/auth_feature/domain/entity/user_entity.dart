class UserEntity {
  final String name, id, email;
  UserEntity({required this.name, required this.id, required this.email});

  // factory UserEntity.fromFirebase(User user){

  //   return UserEntity(
  //     name: user.displayName ?? '',
  //     id: user.uid,
  //     email: user.email ?? '',
  //   );
  // }
}
