import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';
import 'package:news/features/home/domain/repos/news_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.newsRepo) : super(SearchInitial());
  final NewsRepo newsRepo;

  Future<void> getSearchResults({required String query}) async {
    emit(SearchLoading());
    var result = await newsRepo.getSearchResults(query: query);
    result.fold((failure) => emit(SearchFailure(message: failure.message)),
        (articles) => emit(SearchSuccess(articles: articles)));
  }

  Future<void> getFilteredArticles(
      {required String query, required String sortBy}) async {
    emit(SearchLoading());
    var result =
        await newsRepo.getFilteredArticles(query: query, sortBy: sortBy);
    result.fold((failure) => emit(SearchFailure(message: failure.message)),
        (articles) => emit(SearchSuccess(articles: articles)));
  }

  void clearResults() {
    emit(SearchInitial());
  }
}
