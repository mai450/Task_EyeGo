import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/presentation/view/widgets/category_news_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper_function/get_dummy_news.dart';
import '../../manger/cubits/get_category_news/get_category_news_cubit.dart';

class CategoryNewsListBlocBuilder extends StatelessWidget {
  const CategoryNewsListBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryNewsCubit, GetCategoryNewsState>(
      builder: (context, state) {
        if (state is GetCategoryNewsLoading) {
          return Skeletonizer(
              enabled: true,
              child: CategoryNewsList(
                articleEntity: dummyArticles,
              ));
        } else if (state is GetCategoryNewsSuccess) {
          return CategoryNewsList(
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
