import 'package:flutter/material.dart';
import 'package:news/core/utils/widgets/cached_network_img.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';
import 'package:news/features/home/presentation/view/new_view.dart';
import 'package:news/features/home/presentation/view/widgets/new_content.dart';
import 'package:news/features/home/presentation/view/widgets/shadow.dart';

class CategoryListContainer extends StatelessWidget {
  const CategoryListContainer({super.key, required this.articleEntity});

  final ArticleEntity articleEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NewView.routeName,
            arguments: articleEntity);
      },
      child: AspectRatio(
        aspectRatio: 4 / 2,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImg(articleEntity: articleEntity),
              ImageShadow(),
              NewContent(
                  title: articleEntity.title ?? 'No title',
                  des: articleEntity.description ?? 'No description'),
            ],
          ),
        ),
      ),
    );
  }
}
