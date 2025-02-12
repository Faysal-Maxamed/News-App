import 'package:flutter/material.dart';
import 'package:news_app/model/news_article.dart';

class DetailsScreen extends StatelessWidget {
  final NewsArticle article;

  DetailsScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            article.imageUrl.isNotEmpty
                ? Image.network(article.imageUrl)
                : SizedBox(height: 150, child: Center(child: Text("No Image"))),
            SizedBox(height: 10),
            Text(article.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("Read More"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}



