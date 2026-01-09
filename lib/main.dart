import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/onboarding_screen.dart';
import 'package:news_app/service/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          primaryColor: Color(0xFF2563EB), // Royal Blue
          scaffoldBackgroundColor: Color(0xFFF8FAFC), // Slate 50
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: const Color(0xFF1E293B)),
            titleTextStyle: GoogleFonts.poppins(
              color: const Color(0xFF1E293B),
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xFF2563EB),
            secondary: Color(0xFFF59E0B),
          ),
        ),
        home: OnboardingScreen(),
      ),
    );
  }
}
