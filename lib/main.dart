import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helper_function/on_generate_route.dart';
import 'package:news/core/services/shared_preference_singleton.dart';
import 'package:news/features/slpash/presentation/views/splash_view.dart';
import 'package:news/firebase_options.dart';

import 'core/services/custom_bloc_observer.dart';
import 'core/services/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Pref.init();
  Bloc.observer = CustomBlocObserver();
  setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
