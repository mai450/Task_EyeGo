import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';

class CachedNetworkImg extends StatelessWidget {
  const CachedNetworkImg({
    super.key,
    required this.articleEntity,
  });

  final ArticleEntity articleEntity;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: articleEntity.urlToImage ??
          'https://ralfvanveen.com/wp-content/uploads/2021/06/Placeholder-_-Glossary.svg',
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey.shade300,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.broken_image,
        color: Colors.grey,
      ),
    );
  }
}
