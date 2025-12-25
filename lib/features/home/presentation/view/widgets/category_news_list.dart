import 'package:flutter/material.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';
import 'package:news/features/home/presentation/view/widgets/category_list_container.dart';

class CategoryNewsList extends StatelessWidget {
  const CategoryNewsList({super.key, required this.articleEntity});
  final List<ArticleEntity> articleEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CategoryListContainer(
          articleEntity: articleEntity[index],
        );
      },
    );
  }
}
