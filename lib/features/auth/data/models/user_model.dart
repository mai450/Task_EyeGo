import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.uid,
    required super.userName,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? '',
      uid: user.uid,
      userName: user.displayName ?? '',
    );
  }

  factory UserModel.formJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        uid: json['uid'],
        userName: json['userName'],
      );

  factory UserModel.fromEntity(UserEntity user) => UserModel(
        email: user.email,
        uid: user.uid,
        userName: user.userName,
      );

  toMap() {
    return {
      'email': email,
      'uid': uid,
      'userName': userName,
    };
  }
}
