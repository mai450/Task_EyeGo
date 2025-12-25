import 'package:dio/dio.dart';
import 'package:news/features/home/data/models/article_model.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';

class ApiService {
  Dio dio;

  ApiService({required this.dio});

  final String baseUrl = 'https://newsapi.org/v2';
  final String _apiKey = '4e07094086984950af78065d4cff86ac';
  Future<List<ArticleEntity>> getTopHeadlines() async {
    var response = await dio.get(
      '$baseUrl/top-headlines',
      queryParameters: {
        'country': 'us',
        'apiKey': _apiKey,
      },
    );
    final List<dynamic> articles = response.data['articles'];
    return articles.map((e) => ArticleModel.fromJson(e).toEntity()).toList();
  }

  Future<List<ArticleEntity>> getSearchResults({required String query}) async {
    var response = await dio.get(
      '$baseUrl/everything',
      queryParameters: {
        'q': query,
        'apiKey': _apiKey,
      },
    );
    final List<dynamic> articles = response.data['articles'];
    return articles.map((e) => ArticleModel.fromJson(e).toEntity()).toList();
  }

  Future<List<ArticleEntity>> getArticlesByCategory(
      {required String category}) async {
    var response = await dio.get(
      '$baseUrl/top-headlines',
      queryParameters: {
        'category': category,
        'apiKey': _apiKey,
      },
    );
    final List<dynamic> articles = response.data['articles'];
    return articles.map((e) => ArticleModel.fromJson(e).toEntity()).toList();
  }

  Future<List<ArticleEntity>> getFilteredArticles(
      {required String query, required String sortBy}) async {
    var response = await dio.get(
      '$baseUrl/everything',
      queryParameters: {
        'q': query,
        'apiKey': _apiKey,
        'sortBy': sortBy,
      },
    );
    final List<dynamic> articles = response.data['articles'];
    return articles.map((e) => ArticleModel.fromJson(e).toEntity()).toList();
  }
}
