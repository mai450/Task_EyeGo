part of 'get_top_headlines_cubit.dart';

@immutable
sealed class GetTopHeadlinesState {}

final class GetTopHeadlinesInitial extends GetTopHeadlinesState {}

final class GetTopHeadlinesLoading extends GetTopHeadlinesState {}

final class GetTopHeadlinesSuccess extends GetTopHeadlinesState {
  final List<ArticleEntity> articles;
  GetTopHeadlinesSuccess({required this.articles});
}

final class GetTopHeadlinesFailure extends GetTopHeadlinesState {
  final String message;
  GetTopHeadlinesFailure({required this.message});
}
