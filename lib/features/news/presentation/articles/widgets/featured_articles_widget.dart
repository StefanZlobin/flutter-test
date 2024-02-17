import 'package:flutter/material.dart';
import 'package:forestvpn_test/core/enum/app_routes_enum.dart';
import 'package:forestvpn_test/features/news/domain/export.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'featured_article_card_widget.dart';

class FeaturedArticlesWidget extends StatefulWidget {
  const FeaturedArticlesWidget({
    super.key,
    required List<Article> articles,
    required void Function(Article) onScrollArticle,
    required double width,
  })  : _articles = articles,
        _onScrollArticle = onScrollArticle,
        _width = width;

  final List<Article> _articles;
  final void Function(Article) _onScrollArticle;
  final double _width;

  @override
  State<FeaturedArticlesWidget> createState() => _FeaturedArticlesWidgetState();
}

class _FeaturedArticlesWidgetState extends State<FeaturedArticlesWidget> {
  late final SnapScrollListController controller;

  @override
  void initState() {
    controller = SnapScrollListController(itemExtent: widget._width);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ScrollSnapList(
        itemBuilder: (context, index) {
          final article = widget._articles[index];

          return FeaturedArticleCardWidget(
            article: article,
            onCardPressed: (v) => context.go(
              AppRoutesEnum.newsList.routeToPath +
                  '/' +
                  AppRoutesEnum.news.routeToPath,
              extra: v,
            ),
          );
        },
        onItemFocus: (i) {
          if (i == 0) return;

          widget._onScrollArticle.call(widget._articles[i - 1]);
        },
        listPadding: 0,
        scrollController: controller,
        itemExtent: MediaQuery.of(context).size.width - 56,
        scrollPhysics: const PageScrollPhysics(),
      ),
    );
  }
}
