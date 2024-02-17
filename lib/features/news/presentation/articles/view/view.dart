import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:forestvpn_test/features/news/presentation/articles/controllers/featured_articles/featured_articles_cubit.dart';
import 'package:forestvpn_test/features/news/presentation/articles/widgets/featured_articles_widget.dart';

import '../controllers/latest_articles/latest_articles_cubit.dart';
import '../widgets/latest_articles_widget.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({
    super.key,
    required FeaturedArticlesCubit articlesCubit,
    required LatestArticlesCubit latestArticlesCubit,
  })  : _articlesCubit = articlesCubit,
        _latestArticlesCubit = latestArticlesCubit;

  final FeaturedArticlesCubit _articlesCubit;
  final LatestArticlesCubit _latestArticlesCubit;

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late final ScrollController _scrollController;
  double _containerHeight = 300;
  final GlobalKey _animatedContainerKey = GlobalKey();

  void _onScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _containerHeight = 103.0;
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _containerHeight = 300.0;
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController(keepScrollOffset: true)
      ..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              for (final e in widget._articlesCubit.articles) {
                widget._latestArticlesCubit.addArticle(article: e);
              }
            },
            child: const Text(
              'Mark all read',
            ),
          ),
          const SizedBox(width: 16),
        ],
      );

  Widget _buildBody() => ListView.builder(
        controller: _scrollController,
        itemCount: 1,
        padding: const EdgeInsets.fromLTRB(28, 40, 28, 32),
        itemBuilder: (context, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Featured',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            AnimatedContainer(
              key: _animatedContainerKey,
              duration: const Duration(milliseconds: 300),
              height: _containerHeight,
              child: FeaturedArticlesBlocConsumer(
                bloc: widget._articlesCubit,
                listener: (context, state) {},
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox(),
                    loading: () => const SizedBox(),
                    loaded: (articles, _) {
                      return FeaturedArticlesWidget(
                        articles: articles,
                        onScrollArticle: (v) =>
                            widget._latestArticlesCubit.addArticle(article: v),
                        width: MediaQuery.of(context).size.width - 56,
                      );
                    },
                    error: (error) => const SizedBox(),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Latest news',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            LatestArticlesBlocConsumer(
              bloc: widget._latestArticlesCubit,
              listener: (context, state) {},
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () => const SizedBox(),
                  loaded: (articles) {
                    return LatestArticlesWidget(
                      articles: articles,
                    );
                  },
                  error: (error) => const SizedBox(),
                );
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
