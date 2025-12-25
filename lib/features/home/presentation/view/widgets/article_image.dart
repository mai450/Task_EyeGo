import 'package:flutter/material.dart';
import 'package:news/core/utils/widgets/cached_network_img.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({
    super.key,
    required this.articleEntity,
  });

  final ArticleEntity articleEntity;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(),
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImg(articleEntity: articleEntity),
      ),
    );
  }
}
