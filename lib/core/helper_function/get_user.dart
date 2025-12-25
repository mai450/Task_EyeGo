import 'dart:convert';

import 'package:news/core/services/shared_preference_singleton.dart';
import 'package:news/core/utils/backend_endpoints.dart';
import 'package:news/features/auth/data/models/user_model.dart';
import 'package:news/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = Pref.getString(BackendEndpoint.kUserData);
  var userEntity = UserModel.formJson(jsonDecode(jsonString));
  return userEntity;
}
