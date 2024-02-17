import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/common/export.dart';
import 'package:forestvpn_test/features/news/domain/export.dart';
import 'package:forestvpn_test/features/news/domain/use_cases/get_latest_articles_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'latest_articles_cubit.freezed.dart';
part 'latest_articles_state.dart';

typedef LatestArticlesBlocConsumer
    = BlocConsumer<LatestArticlesCubit, LatestArticlesState>;

@lazySingleton
class LatestArticlesCubit extends Cubit<LatestArticlesState> {
  LatestArticlesCubit({
    required GetLatestArticlesUseCase latestArticlesUseCase,
  })  : _latestArticlesUseCase = latestArticlesUseCase,
        super(LatestArticlesState.initial()) {
    getLatestArticles();
  }

  final GetLatestArticlesUseCase _latestArticlesUseCase;

  final List<Article> _latestArticles = [];

  Future<void> getLatestArticles() async {
    emit(LatestArticlesState.loading());

    try {
      final result = await _latestArticlesUseCase.call(NoParams());
      _latestArticles.addAll(result);

      emit(LatestArticlesState.loaded(articles: result));
    } on Exception catch (e) {
      emit(LatestArticlesState.error(error: e.toString()));
    }
  }

  void addArticle({required Article article}) {
    // Если уже есть эта статья, то ничего не делаем
    if (_latestArticles.contains(article)) return;

    _latestArticles.add(article);

    // Эмитем новый стейт с обновленным списком статей
    emit(LatestArticlesState.loaded(articles: _latestArticles));
  }
}
