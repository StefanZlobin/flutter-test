import 'package:flutter/material.dart';
import 'package:forestvpn_test/core/enum/app_routes_enum.dart';
import 'package:forestvpn_test/features/news/domain/export.dart';
import 'package:go_router/go_router.dart';

class LatestArticleCardWidget extends StatelessWidget {
  const LatestArticleCardWidget({
    super.key,
    required Article article,
    required bool isEven,
  })  : _article = article,
        _isEven = isEven;

  final Article _article;
  final bool _isEven;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(
        AppRoutesEnum.newsList.routeToPath +
            '/' +
            AppRoutesEnum.news.routeToPath,
        extra: _article,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 103,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:
                _isEven ? const Color.fromRGBO(245, 245, 245, 1) : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.5),
                offset: const Offset(1, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 90,
                  height: 60,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(_article.imageUrl),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _article.title,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${DateTime.now().difference(_article.publicationDate).inDays} days ago',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
