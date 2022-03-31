import 'package:appsolute_news/Model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  final Article article;

  const DetailsPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Share.share(article.url.toString());
            },
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 70,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
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
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    article.title.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //TODO : si pas de contenue => affiché seuleument l'url
                  Text(article.description.toString(), style: const TextStyle(fontSize: 15),),
                  const SizedBox(height: 15,),
                  Text(article.content.toString(), style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 15,),
                  Text("Écrit par : "+article.author.toString(),style: const TextStyle(
                      fontWeight: FontWeight.bold,),),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () => urlLauncher(article.url.toString()),
                    child: Text(article.source.name.toString()),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  urlLauncher(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
    throw 'Could not launch $url';
  }

  shareUrl(String url) {
    Share.share(url);
  }
}
