import 'package:appsolute_news/Controller/api_news.dart';
import 'package:appsolute_news/Model/article_model.dart';
import 'package:flutter/material.dart';

import '../Widgets/my_list_tile.dart';

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
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
                itemCount: articles!.length,
                itemBuilder: (context, index) => myListTile(articles[index], context)
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

