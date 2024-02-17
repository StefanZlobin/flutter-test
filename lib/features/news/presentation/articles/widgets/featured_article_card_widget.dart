import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/features/news/domain/export.dart';

class FeaturedArticleCardWidget extends StatelessWidget {
  const FeaturedArticleCardWidget({
    super.key,
    required Article article,
    required void Function(Article) onCardPressed,
  })  : _article = article,
        _onCardPressed = onCardPressed;

  final Article _article;
  final void Function(Article) _onCardPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onCardPressed(_article),
      child: CachedNetworkImage(
        imageUrl: _article.imageUrl,
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageBuilder: (context, imageProvider) => SizedBox(
          width: MediaQuery.of(context).size.width - 56,
          height: 300,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: imageProvider,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 40, right: 20),
                child: Text(
                  _article.title,
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => SizedBox(
          width: MediaQuery.of(context).size.width - 56,
          height: 300,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 40, right: 20),
                child: Text(
                  _article.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
