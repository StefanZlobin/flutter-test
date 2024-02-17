import '../entities/article.dart';

abstract interface class INewsRepository {
  Future<List<Article>> getLatestArticles();
  Future<List<Article>> getFeaturedArticles();
  Future<Article> getArticle(String id);
}
