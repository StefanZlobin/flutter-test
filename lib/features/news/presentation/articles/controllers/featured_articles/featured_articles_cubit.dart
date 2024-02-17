import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/common/export.dart';
import 'package:forestvpn_test/features/news/domain/export.dart';
import 'package:forestvpn_test/features/news/domain/use_cases/get_featured_articles_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'featured_articles_cubit.freezed.dart';
part 'featured_articles_state.dart';

typedef FeaturedArticlesBlocConsumer
    = BlocConsumer<FeaturedArticlesCubit, FeaturedArticlesState>;

@lazySingleton
class FeaturedArticlesCubit extends Cubit<FeaturedArticlesState> {
  FeaturedArticlesCubit({
    required GetFeaturedArticlesUseCase featuredArticlesUseCase,
  })  : _featuredArticlesUseCase = featuredArticlesUseCase,
        super(const FeaturedArticlesState.initial()) {
    getFeaturedArticles();
  }

  final GetFeaturedArticlesUseCase _featuredArticlesUseCase;

  late final List<Article> articles;

  Future<void> getFeaturedArticles() async {
    emit(const FeaturedArticlesState.loading());

    try {
      final result = await _featuredArticlesUseCase.call(NoParams());
      articles = result;

      emit(FeaturedArticlesState.loaded(articles: articles));
    } on Exception catch (e) {
      emit(FeaturedArticlesState.error(error: e.toString()));
    }
  }

  void markAllRead() {}
}
