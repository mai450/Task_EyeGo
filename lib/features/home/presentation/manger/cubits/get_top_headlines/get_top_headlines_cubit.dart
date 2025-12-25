import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/features/home/domain/repos/news_repo.dart';

import '../../../../domain/entites/article_entity.dart';

part 'get_top_headlines_state.dart';

class GetTopHeadlinesCubit extends Cubit<GetTopHeadlinesState> {
  GetTopHeadlinesCubit(this.newsRepo) : super(GetTopHeadlinesInitial());

  final NewsRepo newsRepo;
  Future<void> getTopHeadlines() async {
    emit(GetTopHeadlinesLoading());
    var result = await newsRepo.getTopHeadlines();
    result.fold(
        (failure) => emit(GetTopHeadlinesFailure(message: failure.message)),
        (articles) => emit(GetTopHeadlinesSuccess(articles: articles)));
  }

  Future<void> getArticlesByCategory({required String category}) async {
    emit(GetTopHeadlinesLoading());
    var result = await newsRepo.getArticlesByCategory(category: category);
    result.fold(
        (failure) => emit(GetTopHeadlinesFailure(message: failure.message)),
        (articles) => emit(GetTopHeadlinesSuccess(articles: articles)));
  }
}
