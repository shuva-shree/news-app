import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/article-model.dart';

class News {
  final List<ArticleModel>? news = [];

  Future<void> getNews() async {
    final String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=79cfe87d34b04cad912f7e6aae8158a8";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'].toString(),
            title: element['title'].toString(),
            description: element['description'].toString(),
            url: element['url'].toString(),
            urlToImage: element['urlToImage'].toString(),
            content: element['content'].toString(),
          );
          return news!.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  final List<ArticleModel>? news = [];

  Future<void> getNews(String category) async {
    final String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=79cfe87d34b04cad912f7e6aae8158a8";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'].toString(),
            title: element['title'].toString(),
            description: element['description'].toString(),
            url: element['url'].toString(),
            urlToImage: element['urlToImage'].toString(),
            content: element['content'].toString(),
          );
          return news!.add(articleModel);
        }
      });
    }
  }
}
