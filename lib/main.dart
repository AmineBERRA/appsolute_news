import 'dart:developer';

import 'package:flutter/material.dart';
import 'Controller/api_news.dart';
import 'Model/article_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner : false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('AppSolute NEWS', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          log(snapshot.error.toString());
          if(snapshot.hasData){
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(articles[index].title.toString()),
                subtitle: Text(articles[index].source.name.toString()),
              )

            );
            //return const Center(child: Text("BIG SUCCESS"),);
          }
          return const Center(
            child: Text("NOT GOOD"),
          );
        },
      ),
    );
  }
}
