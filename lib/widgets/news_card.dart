import 'package:flutter/material.dart';
import 'package:news_app/model/news_article.dart';
import 'package:news_app/screens/details_screen.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;

  NewsCard(this.article);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: article.imageUrl.isNotEmpty
            ? Image.network(article.imageUrl, width: 80, fit: BoxFit.cover)
            : Container(width: 80, color: Colors.grey),
        title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Text(article.publishedAt, style: TextStyle(color: Colors.grey)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(article),
            ),
          );
        },
      ),
    );
  }
}

