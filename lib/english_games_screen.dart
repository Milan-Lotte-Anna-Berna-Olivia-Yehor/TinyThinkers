import 'package:flutter/material.dart';
import 'games/words_game_screen.dart'; 
import 'games/tracing_game_screen.dart';

class EnglishGamesScreen extends StatelessWidget {
  final String ageGroup;
  final String selectedAvatar;

  const EnglishGamesScreen({super.key, required this.ageGroup, required this.selectedAvatar});

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
                  // BACK BUTTON
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
            
            const SizedBox(height: 10),
            const Text("English Games", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFF3B7EA0))),
            const SizedBox(height: 20),
            
            // --- ZOZNAM HIER ---
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _gameCard(context, "Letters", "Learn to trace", Icons.edit, Colors.green, () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const TracingGameScreen()));
                  }),
                  _gameCard(context, "Phonetics", "Sounds & Letters", Icons.volume_up, Colors.orange, () {
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Coming soon!")));
                  }),
                  _gameCard(context, "Words", "Complete the word", Icons.menu_book, Colors.blue, () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => WordsGameScreen(ageGroup: ageGroup)));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameCard(BuildContext context, String title, String subtitle, IconData icon, Color color, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                  child: Icon(icon, size: 40, color: color),
                ),
                const SizedBox(width: 20),
                Expanded( // Aby text nepretiekol
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 16)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}