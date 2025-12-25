import 'package:flutter/material.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';
import 'package:news/features/home/presentation/view/widgets/new_view_body.dart';

class NewView extends StatelessWidget {
  const NewView({super.key, required this.articleEntity});
  static const routeName = 'new';
  final ArticleEntity articleEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: NewViewBody(
        articleEntity: articleEntity,
      )),
    );
  }
}
