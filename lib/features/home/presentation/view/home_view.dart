import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/services/get_it.dart';
import 'package:news/features/home/domain/repos/news_repo.dart';

import '../manger/cubits/get_category_news/get_category_news_cubit.dart';
import '../manger/cubits/get_top_headlines/get_top_headlines_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetTopHeadlinesCubit(getIt.get<NewsRepo>())..getTopHeadlines(),
        ),
        BlocProvider(
          create: (context) => GetCategoryNewsCubit(
            getIt.get<NewsRepo>(),
          )..getArticlesByCategory(category: 'business'),
        ),
      ],
      child: Scaffold(
        body: SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
