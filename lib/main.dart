import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/theme_colors.dart';
// Neskôr tu importujeme login_screen.dart

void main() {
  runApp(const TinyThinkersApp());
}

class TinyThinkersApp extends StatelessWidget {
  const TinyThinkersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiny Thinkers',
      debugShowCheckedModeBanner: false, // Schová ten červený pásik "DEBUG"
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background, // Nastaví béžovú všade
        textTheme: GoogleFonts.poppinsTextTheme(), // Nastaví font pre celú appku
      ),
      home: const Scaffold(
        body: Center(
          child: Text("Tu bude Login Screen"), 
        ),
      ),
    );
  }
}