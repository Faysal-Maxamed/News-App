import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:news_app/screens/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F172A), // Dark Slate
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0F172A), // Slate 900
                  Color(0xFF1E3A8A), // Blue 900
                  Color(0xFF0F172A),
                ],
              ),
            ),
          ),

          // Decorative Glows
          Positioned(
            top: -100,
            right: -100,
            child: FadeInDown(
              duration: Duration(milliseconds: 1500),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent.withOpacity(0.1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.2),
                      blurRadius: 100,
                      spreadRadius: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: FadeInUp(
              duration: Duration(milliseconds: 1500),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purpleAccent.withOpacity(0.1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withOpacity(0.15),
                      blurRadius: 100,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      child: Text(
                        'NEWS NOW',
                        style: GoogleFonts.poppins(
                          color: Colors.blue[400],
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    delay: Duration(milliseconds: 200),
                    child: Text(
                      'Discover the \nWorld Around You',
                      style: GoogleFonts.poppins(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  FadeInUp(
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 1000),
                    child: Text(
                      'Get the latest updates, deep insights, and trending stories all in one place. Your personalized news feed awaits.',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  FadeInUp(
                    delay: Duration(milliseconds: 600),
                    duration: Duration(milliseconds: 1000),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 65,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF3B82F6),
                              Color(0xFF2563EB)
                            ], // Bright Blue
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF2563EB).withOpacity(0.4),
                              offset: Offset(0, 10),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Explore Now',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward_rounded,
                                color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
