import 'package:flutter/material.dart';
import '../../data/quiz_data.dart';
import 'game_result_screen.dart';

class UniversalQuizScreen extends StatefulWidget {
  final String topic;
  final String ageGroup;

  const UniversalQuizScreen({super.key, required this.topic, required this.ageGroup});

  @override
  State<UniversalQuizScreen> createState() => _UniversalQuizScreenState();
}

class _UniversalQuizScreenState extends State<UniversalQuizScreen> {
  late List<QuizQuestion> questions;
  int currentIndex = 0;
  int score = 0;
  bool isAnswered = false;
  String? selectedOption; // Ukladáme, čo dieťa kliklo

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    questions = QuizData.getQuestions(widget.topic, widget.ageGroup);
    currentIndex = 0;
    score = 0;
    isAnswered = false;
    selectedOption = null;
  }

  void _checkAnswer(String option) {
    if (isAnswered) return; // Zablokuj ďalšie kliky

    setState(() {
      isAnswered = true;
      selectedOption = option;
      if (option == questions[currentIndex].correctAnswer) {
        score++;
      }
    });

    // Pauza, aby dieťa videlo farby, potom ďalšia otázka
    Future.delayed(const Duration(seconds: 2), () {
      if (currentIndex < questions.length - 1) {
        setState(() {
          currentIndex++;
          isAnswered = false;
          selectedOption = null;
        });
      } else {
        // Koniec
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GameResultScreen(
              score: score,
              totalQuestions: questions.length,
              onRestart: () {
                setState(() {
                  _loadQuestions();
                });
              },
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFFDF0E6),
      appBar: AppBar(
        title: Text(widget.topic, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: (currentIndex + 1) / questions.length,
              color: const Color(0xFF3B7EA0),
              backgroundColor: Colors.grey[300],
              minHeight: 10,
              borderRadius: BorderRadius.circular(5),
            ),
            const SizedBox(height: 40),

            // Otázka
            Icon(question.icon, size: 100, color: const Color(0xFF3B7EA0)),
            const SizedBox(height: 20),
            Text(
              question.question,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const Spacer(),

            // Možnosti
            ...question.options.map((option) {
              Color btnColor = Colors.white;
              Color textColor = Colors.black87;
              IconData? feedbackIcon;

              if (isAnswered) {
                if (option == question.correctAnswer) {
                  // Toto je SPRÁVNA odpoveď -> Zelená
                  btnColor = Colors.green[400]!;
                  textColor = Colors.white;
                  feedbackIcon = Icons.check_circle;
                } else if (option == selectedOption) {
                  // Toto je MOJA odpoveď a je ZLÁ -> Červená
                  btnColor = Colors.red[400]!;
                  textColor = Colors.white;
                  feedbackIcon = Icons.cancel;
                } else {
                  // Ostatné odpovede -> Sivá
                  btnColor = Colors.grey[200]!;
                  textColor = Colors.grey;
                }
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () => _checkAnswer(option),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isAnswered && option == question.correctAnswer 
                              ? Colors.green[800]! 
                              : Colors.transparent, 
                          width: 3
                        ),
                      ),
                      elevation: isAnswered ? 0 : 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
                        ),
                        if (feedbackIcon != null)
                          Icon(feedbackIcon, color: textColor),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}