import 'package:flutter/material.dart';

class QuizQuestion {
  final String question;
  final IconData icon; 
  final List<String> options;
  final String correctAnswer;

  QuizQuestion({
    required this.question,
    required this.icon,
    required this.options,
    required this.correctAnswer,
  });
}

class QuizData {
  static List<QuizQuestion> getQuestions(String topic, String ageGroup) {
    // ================== GEOGRAPHY ==================
    if (topic == "Flags") {
      return [
        QuizQuestion(question: "Which country uses this flag? 🇺🇸", icon: Icons.flag, options: ["USA", "UK", "Canada"], correctAnswer: "USA"),
        QuizQuestion(question: "Which country uses this flag? 🇫🇷", icon: Icons.flag, options: ["Italy", "France", "Spain"], correctAnswer: "France"),
        QuizQuestion(question: "Which country uses this flag? 🇯🇵", icon: Icons.flag, options: ["China", "Japan", "Korea"], correctAnswer: "Japan"),
      ];
    }
    if (topic == "Maps") {
      return [
        QuizQuestion(question: "Which shape is Italy?", icon: Icons.map, options: ["Boot", "Circle", "Star"], correctAnswer: "Boot"),
        QuizQuestion(question: "Biggest continent?", icon: Icons.public, options: ["Asia", "Africa", "Europe"], correctAnswer: "Asia"),
        QuizQuestion(question: "Where are penguins?", icon: Icons.ac_unit, options: ["North Pole", "South Pole", "Desert"], correctAnswer: "South Pole"),
      ];
    }
    if (topic == "Landmarks") {
      return [
        QuizQuestion(question: "Where is the Eiffel Tower?", icon: Icons.location_city, options: ["London", "Paris", "Berlin"], correctAnswer: "Paris"),
        QuizQuestion(question: "Where are the Pyramids?", icon: Icons.landscape, options: ["Egypt", "India", "China"], correctAnswer: "Egypt"),
      ];
    }

    // ================== SCIENCE ==================
    if (topic == "Animals") {
      return [
        QuizQuestion(question: "Who says Meow?", icon: Icons.pets, options: ["Dog", "Cat", "Cow"], correctAnswer: "Cat"),
        QuizQuestion(question: "Which animal has a trunk?", icon: Icons.nature, options: ["Elephant", "Lion", "Bear"], correctAnswer: "Elephant"),
        QuizQuestion(question: "Which bird can't fly?", icon: Icons.cruelty_free, options: ["Eagle", "Penguin", "Parrot"], correctAnswer: "Penguin"),
      ];
    }
    if (topic == "Plants") {
      return [
        QuizQuestion(question: "What do plants need?", icon: Icons.water_drop, options: ["Water", "Pizza", "Soda"], correctAnswer: "Water"),
        QuizQuestion(question: "What color are leaves?", icon: Icons.eco, options: ["Blue", "Green", "Red"], correctAnswer: "Green"),
        QuizQuestion(question: "Where do apples grow?", icon: Icons.park, options: ["Ground", "Trees", "Water"], correctAnswer: "Trees"),
      ];
    }
    if (topic == "Body Parts") {
      return [
        QuizQuestion(question: "What do you see with?", icon: Icons.visibility, options: ["Ears", "Eyes", "Nose"], correctAnswer: "Eyes"),
        QuizQuestion(question: "What do you walk with?", icon: Icons.directions_walk, options: ["Hands", "Legs", "Head"], correctAnswer: "Legs"),
      ];
    }
    
    // ================== MATH (Shapes) ==================
    if (topic == "Shapes") {
      return [
        QuizQuestion(question: "What shape is round?", icon: Icons.circle, options: ["Square", "Circle", "Triangle"], correctAnswer: "Circle"),
        QuizQuestion(question: "4 equal sides?", icon: Icons.square, options: ["Rectangle", "Square", "Star"], correctAnswer: "Square"),
        QuizQuestion(question: "3 corners?", icon: Icons.change_history, options: ["Circle", "Triangle", "Hexagon"], correctAnswer: "Triangle"),
      ];
    }

    // Fallback (ak by niečo chýbalo)
    return [
      QuizQuestion(question: "Ready?", icon: Icons.question_mark, options: ["Yes", "No"], correctAnswer: "Yes"),
    ];
  }
}