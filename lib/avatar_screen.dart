import 'package:flutter/material.dart';
import 'difficulty_screen.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({super.key});

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  String? selectedAvatar; // stores selected avatar path

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND
          Positioned.fill(
            child: Image.asset(
              'assets/images/5_avatar_for_child.png',
              fit: BoxFit.cover,
            ),
          ),

          /// ----- ROW 1 -----
          Positioned(
            top: 260,
            left: 43,
            child: _avatarButton(
              avatarPath: 'assets/images/fish.png',
            ),
          ),
          Positioned(
            top: 260,
            right: 43,
            child: _avatarButton(
              avatarPath: 'assets/images/bird.png',
            ),
          ),

          /// ----- ROW 2 -----
          Positioned(
            top: 405,
            left: 43,
            child: _avatarButton(
              avatarPath: 'assets/images/dog.png',
            ),
          ),
          Positioned(
            top: 405,
            right: 43,
            child: _avatarButton(
              avatarPath: 'assets/images/turtle.png',
            ),
          ),

          /// ----- ROW 3 -----
          Positioned(
            top: 540,
            left: 48,
            child: _avatarButton(
              avatarPath: 'assets/images/mouse.png',
            ),
          ),
          Positioned(
            top: 540,
            right: 43,
            child: _avatarButton(
              avatarPath: 'assets/images/cat.png',
            ),
          ),

          /// CONTINUE BUTTON
          Positioned(
            bottom: 98,
            left: 50,
            right: 50,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: selectedAvatar == null
                    ? null // disabled until avatar selected
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
                  disabledBackgroundColor: Colors.grey, // when disabled
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Invisible tap area that SELECTS avatar
  Widget _avatarButton({required String avatarPath}) {
    final bool isSelected = selectedAvatar == avatarPath;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAvatar = avatarPath;
        });
      },
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
