part of 'featured_articles_cubit.dart';

@freezed
class FeaturedArticlesState with _$FeaturedArticlesState {
  const factory FeaturedArticlesState.initial() = _Initial;
  const factory FeaturedArticlesState.loading() = _Loading;
  const factory FeaturedArticlesState.loaded({
    required List<Article> articles,
    @Default(0) int index,
  }) = _Loaded;
  const factory FeaturedArticlesState.error({
    required String error,
  }) = _Error;
}
