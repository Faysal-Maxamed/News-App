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

  Future<void> fetchNews() async {
    isLoading = true;
    notifyListeners();

    try {
      final url =
          'https://newsapi.org/v2/top-headlines?country=us&category=$_category&apiKey=9e07fa330095470fab48223d9b70d2e7';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['articles'] != null) {
          _newsArticles = (data['articles'] as List)
              .map((article) => NewsArticle.fromJson(article))
              .toList();
        } else {
          _newsArticles = [];
        }
      } else {
        print('Failed to load news: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching news: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void changeCategory(String category) {
    _category = category;
    fetchNews();
  }
}
