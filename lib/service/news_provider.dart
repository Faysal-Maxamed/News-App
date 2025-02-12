import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_article.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class NewsProvider with ChangeNotifier {
  List<NewsArticle> _newsArticles = [];
  String _category = 'general';
  bool isLoading = false;

  List<NewsArticle> get newsArticles => _newsArticles;
  String get category => _category;

  String baseUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=9e07fa330095470fab48223d9b70d2e7';

  /// Function to fetch news articles
  Future<void> fetchNews() async {

    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // ✅ Ensure the articles list exists in response
        if (data['articles'] != null) {
          _newsArticles = (data['articles'] as List)
              .map((article) => NewsArticle.fromJson(article))
              .toList();
        } else {
          _newsArticles = [];
        }
      } else {
        throw Exception('Failed to load news');
      }
    } catch (error) {
      print('Error fetching news: $error');
    } 
  }
}


