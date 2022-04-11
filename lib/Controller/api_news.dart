import 'dart:convert';
import 'dart:developer';
import 'package:appsolute_news/Model/article_model.dart';
import 'package:http/http.dart';

class ApiService {

  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=fr&apiKey=74328c8fd614415790aa053a2269b5f6";
  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));
    log(res.toString());
    if (res.statusCode == 200) {
      log(res.statusCode.toString());
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      log(body.toString());
      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();
      log(articles.toString());
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}

/*
class ApiService{
  Future<List<Article>> getArticles() async {
    const url = "http://newsapi.org/v2/top-headlines?country=fr&category=business&apiKey=74328c8fd614415790aa053a2269b5f6";

    var dio = Dio();
    final response = await dio.get(url);
    debugPrint(response.data);
  }
}*/
