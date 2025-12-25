import 'package:dartz/dartz.dart';
import 'package:news/core/errors/failures.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<ArticleEntity>>> getTopHeadlines();
  Future<Either<Failure, List<ArticleEntity>>> getSearchResults(
      {required String query});
  Future<Either<Failure, List<ArticleEntity>>> getFilteredArticles(
      {required String query, required String sortBy});
  Future<Either<Failure, List<ArticleEntity>>> getArticlesByCategory(
      {required String category});
}
