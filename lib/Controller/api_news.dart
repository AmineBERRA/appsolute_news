import 'dart:convert';
import 'package:appsolute_news/Model/article_model.dart';
import 'package:http/http.dart' as http;

class ApiNews {
  final newsUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getNews() async {
    final queryParameters = {
      'country': 'fr',
      'apiKey': '74328c8fd614415790aa053a2269b5f6'
    };
    final uri = Uri.https(newsUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}