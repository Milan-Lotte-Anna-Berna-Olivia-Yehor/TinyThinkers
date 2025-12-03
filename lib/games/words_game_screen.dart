import 'package:flutter/material.dart';

class WordsGameScreen extends StatefulWidget {
  final String ageGroup;

  const WordsGameScreen({super.key, required this.ageGroup});

  @override
  State<WordsGameScreen> createState() => _WordsGameScreenState();
}

class _WordsGameScreenState extends State<WordsGameScreen> {
  // Dáta: Slová podľa veku
  final Map<String, List<Map<String, dynamic>>> gameData = {
    "4 - 7 years old": [
      {"word": "CAT", "missingIndex": 0, "icon": Icons.pets}, // _AT
      {"word": "DOG", "missingIndex": 2, "icon": Icons.pets}, // DO_
      {"word": "SUN", "missingIndex": 1, "icon": Icons.sunny}, // S_N
    ],
    "7 - 10 years old": [
      {"word": "APPLE", "missingIndex": 4, "icon": Icons.fastfood}, // APPL_
      {"word": "HOUSE", "missingIndex": 0, "icon": Icons.house}, // _OUSE
      {"word": "WORLD", "missingIndex": 2, "icon": Icons.public}, // WO_LD
    ],
    "10 - 12 years old": [
      {"word": "FLUTTER", "missingIndex": 3, "icon": Icons.code}, // FLU_TER
      {"word": "SCHOOL", "missingIndex": 2, "icon": Icons.school}, // SC_OOL
      {"word": "PLANET", "missingIndex": 5, "icon": Icons.public}, // PLANE_
    ],
  };

  int currentIndex = 0;
  bool isCorrect = false;

  // Ak by náhodou prišiel neznámy vek, použijeme najľahšiu verziu
  List<Map<String, dynamic>> get currentQuestions => 
      gameData[widget.ageGroup] ?? gameData["4 - 7 years old"]!;

  void _checkAnswer(String letter) {
    if (isCorrect) return; // Už neodpovedaj, ak je to správne

    String correctWord = currentQuestions[currentIndex]['word'];
    int missingIndex = currentQuestions[currentIndex]['missingIndex'];
    String correctLetter = correctWord[missingIndex];

    if (letter == correctLetter) {
      setState(() {
        isCorrect = true;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Good Job! 🎉"), 
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
        ),
      );

      // Po sekunde ďalšia otázka
      Future.delayed(const Duration(seconds: 1), () {
        if (currentIndex < currentQuestions.length - 1) {
          setState(() {
            currentIndex++;
            isCorrect = false;
          });
        } else {
          // Koniec hry - návrat
          Navigator.pop(context); 
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Game Over! Well done!")),
          );
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Try again!"), 
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = currentQuestions[currentIndex];
    String word = question['word'];
    int missingIndex = question['missingIndex'];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find the missing letter"),
        backgroundColor: Colors.blue[100],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1. Ikonka (miesto obrázku)
          Icon(question['icon'], size: 120, color: Colors.orange),
          const SizedBox(height: 40),

          // 2. Slovo s medzerou
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(word.length, (index) {
              bool isMissing = (index == missingIndex);
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 4, color: Colors.black)),
                ),
                child: Text(
                  // Ak je to chýbajúce a ešte sme neuhádli, ukáž podčiarkovník
                  isMissing && !isCorrect ? "_" : word[index],
                  style: const TextStyle(
                    fontSize: 48, 
                    fontWeight: FontWeight.bold,
                    fontFamily: "Courier" // Monospace font vyzerá dobre
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 60),

          // 3. Klávesnica
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("").map((letter) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blue[50],
                  ),
                  onPressed: () => _checkAnswer(letter),
                  child: Text(
                    letter, 
                    style: const TextStyle(fontSize: 22, color: Colors.black)
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}