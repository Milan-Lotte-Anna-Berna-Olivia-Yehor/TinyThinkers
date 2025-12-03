import 'package:flutter/material.dart';

class GameResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onRestart;

  const GameResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    // Výpočet úspešnosti
    double percentage = score / totalQuestions;
    String message = "Good effort!";
    IconData icon = Icons.thumb_up;
    Color color = Colors.orange;

    if (percentage == 1.0) {
      message = "Perfect! 🌟";
      icon = Icons.star;
      color = Colors.amber;
    } else if (percentage >= 0.5) {
      message = "Well done! 👍";
      icon = Icons.sentiment_satisfied_alt;
      color = Colors.green;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFDF0E6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100, color: color),
            const SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 10),
            Text(
              "Score: $score / $totalQuestions",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            
            // Tlačidlo Hrať znova
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); // Zatvorí result screen
                  onRestart(); // Reštartuje hru
                },
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: const Text("Play Again", style: TextStyle(color: Colors.white, fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B7EA0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Tlačidlo Späť do menu
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Zatvorí result
                Navigator.pop(context); // Zatvorí hru -> späť do menu
              },
              child: const Text("Back to Menu", style: TextStyle(fontSize: 18, color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}