import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/presentation/view/widgets/category_news_list.dart';

import 'package:news/features/search/presentation/manger/cubits/search/search_cubit.dart';

class SearchViewBlocBuilder extends StatelessWidget {
  const SearchViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          return CategoryNewsList(
            articleEntity: state.articles,
          );
        } else if (state is SearchFailure) {
          return const Center(child: Text('Something went wrong'));
        } else {
          return const Center(child: Text('No search results '));
        }
      },
    );
  }
}
