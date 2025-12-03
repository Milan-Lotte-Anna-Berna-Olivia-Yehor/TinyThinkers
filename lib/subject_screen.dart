import 'package:flutter/material.dart';
import 'english_games_screen.dart';
import 'math_games_screen.dart';      // <--- NOVÝ IMPORT
import 'science_games_screen.dart';   // <--- NOVÝ IMPORT
import 'geography_games_screen.dart'; // <--- NOVÝ IMPORT

class SubjectScreen extends StatelessWidget {
  final String selectedAvatar;
  final String ageGroup;

  const SubjectScreen({super.key, required this.selectedAvatar, required this.ageGroup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF0E6),
      body: SafeArea(
        child: Column(
          children: [
            // --- HEADER ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        Image.asset('assets/images/brain.png', width: 50),
                        const SizedBox(width: 10),
                        const Text("Tiny Thinkers", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                  Image.asset(selectedAvatar, width: 50),
                ],
              ),
            ),

            const SizedBox(height: 20),
            
            Column(
              children: [
                const Text("Choose a Subject", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFF3B7EA0))),
                Text("Age: $ageGroup", style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            
            const SizedBox(height: 30),

            // --- ZOZNAM ---
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                children: [
                  _subjectCard(context, "English", Icons.language, Colors.orange, () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => EnglishGamesScreen(ageGroup: ageGroup, selectedAvatar: selectedAvatar),
                      ));
                  }),
                  _subjectCard(context, "Math", Icons.calculate, Colors.redAccent, () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MathGamesScreen(ageGroup: ageGroup, selectedAvatar: selectedAvatar),
                      ));
                  }),
                  _subjectCard(context, "Science", Icons.science, Colors.green, () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ScienceGamesScreen(ageGroup: ageGroup, selectedAvatar: selectedAvatar),
                      ));
                  }),
                  _subjectCard(context, "Geography", Icons.public, Colors.blue, () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => GeographyGamesScreen(ageGroup: ageGroup, selectedAvatar: selectedAvatar),
                      ));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subjectCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 90,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: color.withOpacity(0.5), width: 3),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: color.withOpacity(0.15), shape: BoxShape.circle),
                child: Icon(icon, color: color, size: 35),
              ),
              const SizedBox(width: 25),
              Text(title, style: const TextStyle(color: Colors.black87, fontSize: 26, fontWeight: FontWeight.bold)),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 28),
            ],
          ),
        ),
      ),
    );
  }
}