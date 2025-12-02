import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  final String selectedAvatar;

  const SubjectScreen({super.key, required this.selectedAvatar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND (optional)
          Positioned.fill(
            child: Container(
              color: Colors.white,
            ),
          ),

          /// TOP-RIGHT AVATAR
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
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Image.asset(selectedAvatar),
            ),
          ),

          /// MAIN CONTENT
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SubjectButton(
                  label: "English",
                  onTap: () {
                    print("English chosen");
                  },
                ),
                const SizedBox(height: 25),

                SubjectButton(
                  label: "Math",
                  onTap: () {
                    print("Math chosen");
                  },
                ),
                const SizedBox(height: 25),

                SubjectButton(
                  label: "Science",
                  onTap: () {
                    print("Science chosen");
                  },
                ),
                const SizedBox(height: 25),

                SubjectButton(
                  label: "Geography",
                  onTap: () {
                    print("Geography chosen");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom reusable subject button
class SubjectButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const SubjectButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 60,
      child: ElevatedButton(
        onPressed: onTap,
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
