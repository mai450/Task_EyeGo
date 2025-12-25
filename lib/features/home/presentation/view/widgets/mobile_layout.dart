import 'package:flutter/material.dart';
import 'package:news/core/utils/app_styles.dart';
import 'package:news/features/home/presentation/view/widgets/categories_header.dart';
import 'package:news/features/home/presentation/view/widgets/categories_list.dart';
import 'package:news/features/home/presentation/view/widgets/category_news_list_bloc_builder.dart';
import 'package:news/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:news/features/home/presentation/view/widgets/top_headlines_header.dart';
import 'package:news/features/home/presentation/view/widgets/top_headlines_list_bloc_builder.dart';
import 'package:news/features/search/presentation/views/widgets/search_text_field_button.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              SizedBox(
                height: 24,
              ),
              SearchTextFieldButton(),
              SizedBox(
                height: 24,
              ),
              TopHeadlinesHeader(),
              SizedBox(
                height: 12,
              ),
              TopHeadlinesListBlocBuilder(),
              SizedBox(
                height: 24,
              ),
              CategoriesHeader(),
              SizedBox(
                height: 12,
              ),
              CategoriesList(),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('See all', style: TextStyles.regular14),
                ],
              ),
              CategoryNewsListBlocBuilder(),
            ],
          ),
        ),
      ]),
    );
  }
}
