import 'package:flutter/material.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/home/presentation/view/Home_view.dart';
import '../../features/home/presentation/view/new_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/slpash/presentation/views/splash_view.dart';
import '../../features/start/presentation/views/start_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

    case StartView.routeName:
      return MaterialPageRoute(builder: (_) => const StartView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());

    case SearchView.routeName:
      return MaterialPageRoute(builder: (_) => const SearchView());

    case NewView.routeName:
      final article = settings.arguments as ArticleEntity;
      return MaterialPageRoute(
          builder: (_) => NewView(
                articleEntity: article,
              ));

    default:
      return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}
