import 'package:flutter/material.dart';
import 'package:forestvpn_test/features/news/domain/export.dart';

import 'latest_article_card_widget.dart';

class LatestArticlesWidget extends StatelessWidget {
  const LatestArticlesWidget({
    super.key,
    required List<Article> articles,
  }) : _articles = articles;

  final List<Article> _articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final article = _articles[index];

        return LatestArticleCardWidget(
          article: article,
          isEven: index.isEven,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: _articles.length,
    );
  }
}
