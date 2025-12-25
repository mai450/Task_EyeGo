import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/features/home/domain/entites/article_entity.dart';
import 'package:news/features/home/domain/repos/news_repo.dart';

part 'get_category_news_state.dart';

class GetCategoryNewsCubit extends Cubit<GetCategoryNewsState> {
  GetCategoryNewsCubit(this.newsRepo) : super(GetCategoryNewsInitial());

  final NewsRepo newsRepo;
  Future<void> getArticlesByCategory({required String category}) async {
    emit(GetCategoryNewsLoading());
    var result = await newsRepo.getArticlesByCategory(category: category);
    result.fold(
        (failure) => emit(GetCategoryNewsFailure(message: failure.message)),
        (articles) {
      emit(GetCategoryNewsSuccess(articles: articles));
    });
  }
}
