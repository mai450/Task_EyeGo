import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/core/services/api_service.dart';
import 'package:news/features/home/data/repos/news_repo_imple.dart';
import 'package:news/features/home/domain/repos/news_repo.dart';

import '../../features/auth/data/repos/auth_repo_imple.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import 'database_services.dart';
import 'firebase_auth_services.dart';
import 'firebase_store_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseServices>(FirebaseServices());
  getIt.registerSingleton<DataBaseServices>(FirestoreServices());

  getIt.registerSingleton<AuthRepo>(AuthRepoImple(
      firebaseServices: getIt<FirebaseServices>(),
      dataBaseServices: getIt<DataBaseServices>()));

  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiService>(ApiService(dio: getIt<Dio>()));

  getIt.registerSingleton<NewsRepo>(
      NewsRepoImple(apiService: getIt<ApiService>()));
}
