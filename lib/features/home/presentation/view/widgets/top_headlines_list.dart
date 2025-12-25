import 'package:flutter/material.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';
import 'package:news/features/home/presentation/view/widgets/top_headlines_list_container.dart';

class TopHeadlinesList extends StatelessWidget {
  const TopHeadlinesList({super.key, required this.articleEntity});
  final List<ArticleEntity> articleEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return TopHeadlinesListContainer(
            articleEntity: articleEntity[index],
          );
        },
      ),
    );
  }
}
