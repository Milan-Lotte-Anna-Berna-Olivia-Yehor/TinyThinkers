import 'package:flutter/material.dart';
import 'subject_screen.dart';

class DifficultyScreen extends StatelessWidget {
  final String selectedAvatar;

  const DifficultyScreen({super.key, required this.selectedAvatar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// TOP-RIGHT avatar
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Image.asset(selectedAvatar),
            ),
          ),

          /// Difficulty buttons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _difficultyButton(context, "4 - 7 years old"),
                const SizedBox(height: 30),

                _difficultyButton(context, "7 - 10 years old"),
                const SizedBox(height: 30),

                _difficultyButton(context, "10 - 12 years old"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// BUTTON BUILDER
  Widget _difficultyButton(BuildContext context, String label) {
    return SizedBox(
      width: 260,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          // HERE is where the navigation happens
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubjectScreen(
                selectedAvatar: selectedAvatar,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3B7EA0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

