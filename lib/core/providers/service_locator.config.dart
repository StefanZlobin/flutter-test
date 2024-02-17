// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:forestvpn_test/features/news/data/repositories/news_repository_impl.dart'
    as _i4;
import 'package:forestvpn_test/features/news/domain/export.dart' as _i3;
import 'package:forestvpn_test/features/news/domain/repositories/news_repository.dart'
    as _i6;
import 'package:forestvpn_test/features/news/domain/use_cases/get_article_use_case.dart'
    as _i5;
import 'package:forestvpn_test/features/news/domain/use_cases/get_featured_articles_use_case.dart'
    as _i7;
import 'package:forestvpn_test/features/news/domain/use_cases/get_latest_articles_use_case.dart'
    as _i8;
import 'package:forestvpn_test/features/news/presentation/articles/controllers/featured_articles/featured_articles_cubit.dart'
    as _i10;
import 'package:forestvpn_test/features/news/presentation/articles/controllers/latest_articles/latest_articles_cubit.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.INewsRepository>(() => _i4.NewsRepositoryImpl());
    gh.lazySingleton<_i5.GetArticleUseCase>(
        () => _i5.GetArticleUseCase(newsRepository: gh<_i6.INewsRepository>()));
    gh.lazySingleton<_i7.GetFeaturedArticlesUseCase>(() =>
        _i7.GetFeaturedArticlesUseCase(
            newsRepository: gh<_i6.INewsRepository>()));
    gh.lazySingleton<_i8.GetLatestArticlesUseCase>(() =>
        _i8.GetLatestArticlesUseCase(
            newsRepository: gh<_i6.INewsRepository>()));
    gh.lazySingleton<_i9.LatestArticlesCubit>(() => _i9.LatestArticlesCubit(
        latestArticlesUseCase: gh<_i8.GetLatestArticlesUseCase>()));
    gh.lazySingleton<_i10.FeaturedArticlesCubit>(() =>
        _i10.FeaturedArticlesCubit(
            featuredArticlesUseCase: gh<_i7.GetFeaturedArticlesUseCase>()));
    return this;
  }
}
