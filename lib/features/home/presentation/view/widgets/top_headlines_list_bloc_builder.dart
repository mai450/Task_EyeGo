import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/presentation/manger/cubits/get_top_headlines/get_top_headlines_cubit.dart';
import 'package:news/features/home/presentation/view/widgets/top_headlines_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper_function/get_dummy_news.dart';

class TopHeadlinesListBlocBuilder extends StatelessWidget {
  const TopHeadlinesListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTopHeadlinesCubit, GetTopHeadlinesState>(
      builder: (context, state) {
        if (state is GetTopHeadlinesLoading) {
          return Skeletonizer(
              enabled: true,
              child: TopHeadlinesList(
                articleEntity: dummyArticles,
              ));
        } else if (state is GetTopHeadlinesSuccess) {
          return TopHeadlinesList(
            articleEntity: state.articles,
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}
