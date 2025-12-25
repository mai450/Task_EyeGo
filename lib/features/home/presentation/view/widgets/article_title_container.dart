import 'package:flutter/material.dart';
import 'package:news/core/helper_function/format_date.dart';
import 'package:news/core/utils/app_styles.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';

class ArticleTitleContainer extends StatelessWidget {
  const ArticleTitleContainer({
    super.key,
    required this.articleEntity,
  });

  final ArticleEntity articleEntity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -60,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          margin: const EdgeInsets.only(top: 280),
          decoration: const BoxDecoration(
              color: Color.fromARGB(243, 189, 196, 210),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formatArticleDate(articleEntity.publishedAt),
                  style: TextStyles.regular11.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  articleEntity.title ?? 'No title',
                  style: TextStyles.bold16.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Published by ${articleEntity.author ?? ''}',
                      style: TextStyles.regular11.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
