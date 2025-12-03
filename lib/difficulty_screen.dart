import 'package:flutter/material.dart';
import 'subject_screen.dart';

class DifficultyScreen extends StatelessWidget {
  final String selectedAvatar;

  const DifficultyScreen({super.key, required this.selectedAvatar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF0E6),
      body: SafeArea(
        child: Stack(
          children: [
            // --- HLAVNÝ OBSAH ---
            Column(
              children: [
                // 1. Header (Navigácia)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tlačidlo SPÄŤ (Mozog + Text)
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          children: [
                            Image.asset('assets/images/brain.png', width: 50),
                            const SizedBox(width: 10),
                            const Text(
                              "Tiny Thinkers",
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      
                      // Ikonka Avatara (len pre info / zmenu)
                      GestureDetector(
                        onTap: () => Navigator.pop(context), // Tiež vráti späť na výber
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF3B7EA0), width: 2),
                          ),
                          child: Image.asset(selectedAvatar, width: 40, height: 40),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 1), // Pružná medzera

                // 2. Nadpis
                const Text(
                  "Select Age",
                  style: TextStyle(
                    fontSize: 34, 
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF3B7EA0),
                  ),
                ),
                
                const SizedBox(height: 40),

                // 3. Tlačidlá
                _difficultyButton(context, "4 - 7 years old"),
                const SizedBox(height: 25),
                _difficultyButton(context, "7 - 10 years old"),
                const SizedBox(height: 25),
                _difficultyButton(context, "10 - 12 years old"),

                const Spacer(flex: 2), // Pružná medzera dole
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _difficultyButton(BuildContext context, String label) {
    return SizedBox(
      width: 300,
      height: 75,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubjectScreen(
                selectedAvatar: selectedAvatar,
                ageGroup: label,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3B7EA0),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}