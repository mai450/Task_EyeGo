import 'package:flutter/material.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';
import 'package:news/features/home/presentation/view/widgets/arrow_back.dart';
import 'package:news/features/home/presentation/view/widgets/article_content_conatiner.dart';
import 'package:news/features/home/presentation/view/widgets/article_image.dart';
import 'package:news/features/home/presentation/view/widgets/article_title_container.dart';

class NewViewBody extends StatelessWidget {
  const NewViewBody({super.key, required this.articleEntity});

  final ArticleEntity articleEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      ArticleImage(articleEntity: articleEntity),
      ArrowBack(),
      ArticleContentContainer(articleEntity: articleEntity),
      ArticleTitleContainer(articleEntity: articleEntity),
    ]);
  }
}
