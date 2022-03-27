import 'package:appsolute_news/Model/article_model.dart';
import 'package:flutter/material.dart';

Widget myListTile(Article article, BuildContext context) {
  return Column(
    children: [
      Text(article.title),
      Text(article.source.name)
    ],
  );
}
