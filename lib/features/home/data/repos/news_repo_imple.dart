import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news/core/errors/dio_exceptions.dart';
import 'package:news/core/errors/failures.dart';
import 'package:news/core/services/api_service.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';
import 'package:news/features/home/domain/repos/news_repo.dart';

class NewsRepoImple implements NewsRepo {
  final ApiService apiService;
  NewsRepoImple({required this.apiService});
  @override
  Future<Either<Failure, List<ArticleEntity>>> getArticlesByCategory(
      {required String category}) async {
    try {
      var result = await apiService.getArticlesByCategory(category: category);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerError.fromDioException(e),
        );
      }
      return left(
        ServerError(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getFilteredArticles(
      {required String query, required String sortBy}) async {
    try {
      var result =
          await apiService.getFilteredArticles(query: query, sortBy: sortBy);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerError.fromDioException(e),
        );
      }
      return left(
        ServerError(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getSearchResults(
      {required String query}) async {
    try {
      var result = await apiService.getSearchResults(query: query);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerError.fromDioException(e),
        );
      }
      return left(
        ServerError(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getTopHeadlines() async {
    try {
      var result = await apiService.getTopHeadlines();
      return right(result);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
        return left(
          ServerError.fromDioException(e),
        );
      }
      log(e.toString());

      return left(
        ServerError(
          e.toString(),
        ),
      );
    }
  }
}
