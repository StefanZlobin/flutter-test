import 'package:forestvpn_test/common/export.dart';
import 'package:injectable/injectable.dart';

import '../entities/article.dart';
import '../repositories/news_repository.dart';

@lazySingleton
final class GetFeaturedArticlesUseCase extends UseCase<List<Article>, NoParams> {
  GetFeaturedArticlesUseCase({
    required INewsRepository newsRepository,
  }) : _newsRepository = newsRepository;

  final INewsRepository _newsRepository;

  @override
  Future<List<Article>> call(NoParams params) async {
    return await _newsRepository.getFeaturedArticles();
  }
}
