import 'package:dio/dio.dart';
import 'package:newsapp/models/articaleModel.dart';

class newsservice {
  final Dio dio;

  newsservice(this.dio);

  Future<List<ArticleModel>> getnews() async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=a975db964aa644feb527415f65256305');

      // print(response);
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
