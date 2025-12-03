import 'package:flutter/material.dart';
import 'difficulty_screen.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({super.key});

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  String? selectedAvatar; 

  final List<String> avatars = [
    'assets/images/fish.png',
    'assets/images/bird.png',
    'assets/images/dog.png',
    'assets/images/turtle.png',
    'assets/images/mouse.png',
    'assets/images/cat.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF0E6),
      body: SafeArea(
        child: Column(
          children: [
            // --- HEADER (Späť na Login) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context), // Návrat na Login
                child: Row(
                  children: [
                    Image.asset('assets/images/brain.png', width: 50), 
                    const SizedBox(width: 10),
                    const Text(
                      "Tiny Thinkers",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            
            const Text(
              "Choose your Avatar",
              style: TextStyle(
                fontSize: 26, 
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B7EA0),
              ),
            ),
            
            const SizedBox(height: 20),

            // --- GRID AVATAROV ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GridView.builder(
                  itemCount: avatars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 25, // Väčšie medzery
                    mainAxisSpacing: 25,
                    childAspectRatio: 1.0, // Štvorec - vyzerá to najlepšie
                  ),
                  itemBuilder: (context, index) {
                    return _avatarItem(avatars[index]);
                  },
                ),
              ),
            ),

            // --- CONTINUE BUTTON ---
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
              child: SizedBox(
                width: double.infinity,
                height: 65,
                child: ElevatedButton(
                  onPressed: selectedAvatar == null
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DifficultyScreen(
                                selectedAvatar: selectedAvatar!,
                              ),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B7EA0),
                    disabledBackgroundColor: Colors.grey.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatarItem(String avatarPath) {
    final bool isSelected = selectedAvatar == avatarPath;

    return GestureDetector(
      onTap: () => setState(() => selectedAvatar = avatarPath),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF3B7EA0) : Colors.transparent,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: Image.asset(avatarPath, fit: BoxFit.contain),
      ),
    );
  }
}