import 'package:flutter/material.dart';
import 'package:newsapp/models/articaleModel.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.articleModel,
  });

  final ArticleModel articleModel;

//final newsTilemodel news;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 25,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          articleModel.image,
          height: 200,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Text(
        articleModel.title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        articleModel.subtitle ?? "",
        style: const TextStyle(fontSize: 20, color: Colors.grey),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    ]);
  }
}
