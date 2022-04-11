import 'package:appsolute_news/View/list_view.dart';
import 'package:appsolute_news/constant.dart';
import 'package:flutter/material.dart';
import 'Controller/api_news.dart';

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
        backgroundColor: redAppsolute,
        centerTitle: true,
        elevation: 20,
      ),
      body: const ListViewPage(),
    );
  }
}
