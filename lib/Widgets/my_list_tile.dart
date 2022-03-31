import 'package:appsolute_news/Model/article_model.dart';
import 'package:appsolute_news/View/details_news.dart';
import 'package:appsolute_news/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget myListTile(Article article, BuildContext context) {

  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  var newDate = formatter.format(DateTime.parse(article.publishedAt.toString()));

  return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(
                      article: article,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 20.0,
              ),
            ]),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            article.urlToImage != null
                ? Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(article.urlToImage.toString()),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  )
                : Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyfaaAwBjTKRFO19wUAc8ZRtDBcEl9kpvyUw&usqp=CAU'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
            const SizedBox(height: 8.0),
            Text(
              article.title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: blueAppsolute,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Text(
                    "Source : " + article.source.name.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Text(newDate,style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      ));

}
