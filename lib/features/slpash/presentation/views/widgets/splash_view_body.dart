import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/core/services/shared_preference_singleton.dart';
import 'package:news/features/home/presentation/view/Home_view.dart';

import '../../../../../core/services/firebase_auth_services.dart';
import '../../../../../core/utils/backend_endpoints.dart';
import '../../../../auth/presentation/views/login_view.dart';
import '../../../../start/presentation/views/start_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/Loading.json',
        width: 200,
      ),
    );
  }

  void executeNavigation() {
    bool isStartViewSeen = Pref.getBool(kIsStartSeen);

    Future.delayed(const Duration(seconds: 3), () async {
      if (isStartViewSeen) {
        var isLoggedIn = await FirebaseServices().isLoggedIn();
        if (isLoggedIn) {
          Navigator.of(context).pushReplacementNamed(HomeView.routeName);
        } else {
          Navigator.of(context).pushReplacementNamed(LoginView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, StartView.routeName);
      }
    });
  }
}
