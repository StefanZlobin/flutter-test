import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/common/export.dart';
import 'package:injectable/injectable.dart';

import '../entities/article.dart';
import '../repositories/news_repository.dart';

@lazySingleton
final class GetArticleUseCase extends UseCase<Article, Params> {
  GetArticleUseCase({
    required INewsRepository newsRepository,
  }) : _newsRepository = newsRepository;

  final INewsRepository _newsRepository;

  @override
  Future<Article> call(Params params) async {
    return await _newsRepository.getArticle(params.id);
  }
}

class Params extends Equatable {
  const Params({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}
