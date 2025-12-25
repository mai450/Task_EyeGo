import 'package:news/features/home/domain/entites/article_entity.dart';

ArticleEntity dummyArticle = ArticleEntity(
  author: 'BBC News',
  title: 'Global Markets Rally as Inflation Cools',
  description:
      'Stocks around the world surged after new data showed inflation slowing down in major economies.',
  urlToImage: 'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a',
  publishedAt: '2025-01-20',
  content:
      'Global stock markets rallied on Monday as investors reacted positively to new inflation data...',
);

List<ArticleEntity> dummyArticles = [
  dummyArticle,
  dummyArticle,
  dummyArticle,
  dummyArticle,
  dummyArticle,
  dummyArticle,
  dummyArticle,
  dummyArticle,
];
