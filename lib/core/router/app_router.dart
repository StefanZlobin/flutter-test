import 'package:forestvpn_test/core/enum/app_routes_enum.dart';
import 'package:forestvpn_test/core/providers/service_locator.dart';
import 'package:forestvpn_test/features/news/domain/entities/article.dart';
import 'package:forestvpn_test/features/news/presentation/article/view/view.dart';
import 'package:forestvpn_test/features/news/presentation/articles/controllers/featured_articles/featured_articles_cubit.dart';
import 'package:forestvpn_test/features/news/presentation/articles/controllers/latest_articles/latest_articles_cubit.dart';
import 'package:forestvpn_test/features/news/presentation/articles/view/view.dart';
import 'package:go_router/go_router.dart';

final class AppRouter {
  GoRouter get goRouter => _goRouter;

  late final _goRouter = GoRouter(
    initialLocation: AppRoutesEnum.newsList.routeToPath,
    routes: [
      GoRoute(
        path: AppRoutesEnum.newsList.routeToPath,
        name: AppRoutesEnum.newsList.routeToName,
        builder: (context, state) {
          return NewsListPage(
            articlesCubit: getIt<FeaturedArticlesCubit>(),
            latestArticlesCubit: getIt<LatestArticlesCubit>(),
          );
        },
        routes: [
          GoRoute(
            path: AppRoutesEnum.news.routeToPath,
            name: AppRoutesEnum.news.routeToName,
            builder: (context, state) {
              final param = state.extra as Article;

              return NewsPage(article: param);
            },
          ),
        ],
      ),
    ],
  );
}
