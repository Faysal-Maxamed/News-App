import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/service/news_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/news_card.dart';
import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsProvider>(context, listen: false).fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          'Discover',
          style: GoogleFonts.poppins(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.search, color: Color(0xFF1E293B)),
              onPressed: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.info_outline_rounded, color: Color(0xFF1E293B)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'News from all over the world',
              style: GoogleFonts.poppins(
                color: Color(0xFF64748B),
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 16),
          _buildCategorySelector(newsProvider),
          SizedBox(height: 16),
          Expanded(
            child: newsProvider.isLoading
                ? Center(
                    child: CircularProgressIndicator(color: Color(0xFF2563EB)))
                : newsProvider.newsArticles.isEmpty
                    ? Center(
                        child:
                            Text("No news found", style: GoogleFonts.poppins()))
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(top: 10),
                        itemCount: newsProvider.newsArticles.length,
                        itemBuilder: (context, index) {
                          return FadeInUp(
                            duration: Duration(milliseconds: 500),
                            delay: Duration(
                                milliseconds: (index * 100).clamp(0, 500)),
                            child: NewsCard(newsProvider.newsArticles[index]),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySelector(NewsProvider provider) {
    final categories = [
      'general',
      'business',
      'sports',
      'technology',
      'entertainment',
      'health',
      'science'
    ];

    return Container(
      height: 50,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = provider.category == category;
          return GestureDetector(
            onTap: () => provider.changeCategory(category),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF2563EB) : Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Color(0xFF2563EB).withOpacity(0.4),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        )
                      ],
                border:
                    isSelected ? null : Border.all(color: Colors.grey.shade200),
              ),
              child: Center(
                child: Text(
                  category[0].toUpperCase() + category.substring(1),
                  style: GoogleFonts.poppins(
                    color: isSelected ? Colors.white : Color(0xFF64748B),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
