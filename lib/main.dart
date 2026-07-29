import 'package:MicroMinds/src/views/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
  // Uncomment when using Provider:
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => ThemeProvider()),
  //     ],
  //     child: const MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, // Modern Material Design
        textTheme: TextTheme(
          displayLarge: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.lato(fontSize: 14),
          bodySmall: GoogleFonts.lato(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
