import 'package:appsolute_news/Controller/api_news.dart';
import 'package:appsolute_news/Model/article_model.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if(snapshot.hasData){
            return const Center(
              child: Text("OK"),
            );
          }
          return const Center(
            child: Text("NOT GOOD"),
          );
        },
      ),
    );
  }
}

