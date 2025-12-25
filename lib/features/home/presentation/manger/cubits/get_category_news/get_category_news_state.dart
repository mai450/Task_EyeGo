part of 'get_category_news_cubit.dart';

@immutable
sealed class GetCategoryNewsState {}

final class GetCategoryNewsInitial extends GetCategoryNewsState {}

final class GetCategoryNewsLoading extends GetCategoryNewsState {}

final class GetCategoryNewsSuccess extends GetCategoryNewsState {
  final List<ArticleEntity> articles;
  GetCategoryNewsSuccess({required this.articles});
}

final class GetCategoryNewsFailure extends GetCategoryNewsState {
  final String message;
  GetCategoryNewsFailure({required this.message});
}
