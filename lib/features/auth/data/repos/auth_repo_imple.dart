import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/exceptaions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/database_services.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../../../core/services/shared_preference_singleton.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImple implements AuthRepo {
  final FirebaseServices firebaseServices;
  final DataBaseServices dataBaseServices;

  AuthRepoImple(
      {required this.dataBaseServices, required this.firebaseServices});

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseServices.signUpWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        email: email,
        uid: user.uid,
        userName: name,
      );
      await addUserData(
        user: userEntity,
      );
      return right(userEntity);
    } on CustomExecption catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      return left(
          ServerFailure('Something went wrong. please try again later.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseServices.signInWithEmailAndPassword(
          input: email, password: password);
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExecption catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(
          ServerFailure('Something went wrong. please try again later.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await dataBaseServices.checkIfUserExists(
          path: BackendEndpoint.addUserData, docId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomExecption catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);

      return left(
          ServerFailure('Something went wrong. please try again later.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await dataBaseServices.addData(
        path: BackendEndpoint.addUserData,
        data: UserModel.fromEntity(user).toMap(),
        docId: user.uid);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var data = await dataBaseServices.getData(
        path: BackendEndpoint.addUserData, docId: uid);
    return UserModel.formJson(data);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Pref.setString(BackendEndpoint.kUserData, jsonData);
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseServices.deleteUser();
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await firebaseServices.signOut();
      return right(null);
    } on CustomExecption catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
