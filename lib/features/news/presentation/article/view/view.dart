import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/features/news/domain/export.dart';
import 'package:go_router/go_router.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({
    super.key,
    required Article article,
  }) : _article = article;

  final Article _article;

  @override
  Widget build(BuildContext context) {
    Widget _buildBody() => CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: GestureDetector(
                onTap: () => context.pop(),
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                ),
              ),
              expandedHeight: 495,
              flexibleSpace: Container(
                height: 495,
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black38,
                      Colors.black45,
                      Colors.black54,
                      Colors.black87,
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(_article.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  _article.title,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 3,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(21, 32, 21, 0),
                  child: Text(_article.description ?? ''),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CachedNetworkImage(
                imageUrl: _article.imageUrl,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 21,
                      vertical: 20,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );

    return Scaffold(
      //appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
