import 'package:flutter/cupertino.dart';

import '../models/articaleModel.dart';
import '../views/newsTile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
      return NewsTile(
        articleModel: articles[index],
      );
    }));
  }
}
