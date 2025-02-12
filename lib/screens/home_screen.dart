import 'package:flutter/material.dart';
import 'package:news_app/service/news_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('News App')),
      body: Column(
        children: [
          _buildCategorySelector(newsProvider),
          Expanded(
            child: newsProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: newsProvider.newsArticles.length,
                    itemBuilder: (context, index) {
                      return NewsCard(newsProvider.newsArticles[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySelector(NewsProvider provider) {
    final categories = ['general', 'business', 'sports', 'technology', 'entertainment'];

    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                label: Text(
                  category.toUpperCase(),
                  style: TextStyle(
                    color: provider.category == category ? Colors.white : Colors.black,
                  ),
                ),
                backgroundColor: provider.category == category ? Colors.blue : Colors.grey[300],
              ),
            ),
          );
        },
      ),
    );
  }
}
