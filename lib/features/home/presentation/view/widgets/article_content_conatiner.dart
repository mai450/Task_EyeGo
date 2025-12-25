import 'package:flutter/material.dart';
import 'package:news/core/utils/app_styles.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';

class ArticleContentContainer extends StatelessWidget {
  const ArticleContentContainer({
    super.key,
    required this.articleEntity,
  });

  final ArticleEntity articleEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.55,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1046,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyles.bold16.copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                      text:
                          '${articleEntity.content?.trim().split(' ').first} ',
                    ),
                    TextSpan(
                        text: articleEntity.content
                                ?.trim()
                                .split(' ')
                                .skip(1)
                                .join(' ') ??
                            '',
                        style:
                            TextStyles.regular14.copyWith(color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
