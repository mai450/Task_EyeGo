import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/services/get_it.dart';
import 'package:news/features/home/domain/repos/news_repo.dart';
import 'package:news/features/search/presentation/manger/cubits/search/search_cubit.dart';
import 'package:news/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const String routeName = 'search';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<NewsRepo>()),
      child: Scaffold(
        body: SafeArea(child: SearchViewBody()),
      ),
    );
  }
}
