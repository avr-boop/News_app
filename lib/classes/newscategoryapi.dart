import 'package:news_app/models/article_model.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';

class ListNews {
  List<Article> newsList = [];

  Future<void> getNewsForCategory(String category) async {
    var url = Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=c864499e5de045ae8714ff193f4c14e0");

    var response = await get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['title'] != null &&
            element['publishedAt'] != null &&
            element['content'] != null &&
            element['url'] != null) {
          Article article = Article(
            element['title'],
            element['description'],
            element['urlToImage'],
            DateTime.parse(element['publishedAt']),
            element["content"],
            element["url"],
          );
          newsList.add(article);
        }
      });
    }
  }
}
