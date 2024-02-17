part of 'latest_articles_cubit.dart';

@unfreezed
class LatestArticlesState with _$LatestArticlesState {
  factory LatestArticlesState.initial() = _Initial;
  factory LatestArticlesState.loading() = _Loading;
  factory LatestArticlesState.loaded({
    required List<Article> articles,
  }) = _Loaded;
  factory LatestArticlesState.error({
    required String error,
  }) = _Error;
}
