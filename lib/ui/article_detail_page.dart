import 'package:flutter/material.dart';
import 'package:news_app/common/navigation.dart';
import 'package:news_app/data/model/Article.dart';
import 'package:news_app/ui/article_web_view.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            article.urlToImage == null
                ? const SizedBox(
                    height: 200,
                    child: Icon(Icons.error),
                  )
                : Hero(
                    tag: article.urlToImage!,
                    child: Image.network(article.urlToImage!),
                  ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.description ?? "",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    article.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Text("Date: ${article.publishedAt}"),
                  const SizedBox(height: 10),
                  Text("Author: ${article.author}"),
                  const Divider(color: Colors.grey),
                  Text(
                    article.content ?? "",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigation.intentWithData(
                        ArticleWebView.routeName,
                        article.url,
                      );
                    },
                    child: const Text("Read More"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
