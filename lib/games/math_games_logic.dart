import 'package:flutter/material.dart';
import 'dart:math';
import 'game_result_screen.dart';

// --- HRA 1: POČÍTANIE ---
class CountingGameScreen extends StatefulWidget {
  const CountingGameScreen({super.key});
  @override
  State<CountingGameScreen> createState() => _CountingGameScreenState();
}

class _CountingGameScreenState extends State<CountingGameScreen> {
  int targetNumber = 0;
  List<int> options = [];
  int round = 0;
  int score = 0;
  final int totalRounds = 5;

  @override
  void initState() {
    super.initState();
    _generateRound();
  }

  void _generateRound() {
    Random r = Random();
    targetNumber = r.nextInt(9) + 1; // 1 až 9
    
    // Vygeneruj 2 nesprávne možnosti
    Set<int> opts = {targetNumber};
    while (opts.length < 3) {
      opts.add(r.nextInt(9) + 1);
    }
    options = opts.toList()..shuffle();
  }

  void _answer(int number) {
    if (number == targetNumber) score++;
    
    if (round < totalRounds - 1) {
      setState(() {
        round++;
        _generateRound();
      });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => 
        GameResultScreen(score: score, totalQuestions: totalRounds, onRestart: () {
          setState(() { round = 0; score = 0; _generateRound(); });
        })
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF0E6),
      appBar: AppBar(title: const Text("Counting"), backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("How many?", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          
          // Zobrazenie ikoniek (napr. jabĺčka)
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: List.generate(targetNumber, (index) => 
              const Icon(Icons.apple, size: 60, color: Colors.redAccent)
            ),
          ),
          
          const SizedBox(height: 60),
          
          // Tlačidlá
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: options.map((num) => ElevatedButton(
              onPressed: () => _answer(num),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(25),
                backgroundColor: Colors.white,
              ),
              child: Text("$num", style: const TextStyle(fontSize: 30, color: Colors.black)),
            )).toList(),
          )
        ],
      ),
    );
  }
}

// --- HRA 2: SČÍTANIE ---
class AdditionGameScreen extends StatefulWidget {
  const AdditionGameScreen({super.key});
  @override
  State<AdditionGameScreen> createState() => _AdditionGameScreenState();
}

class _AdditionGameScreenState extends State<AdditionGameScreen> {
  int a = 0, b = 0;
  List<int> options = [];
  int round = 0;
  int score = 0;
  final int totalRounds = 5;

  @override
  void initState() {
    super.initState();
    _generateRound();
  }

  void _generateRound() {
    Random r = Random();
    a = r.nextInt(5) + 1;
    b = r.nextInt(5) + 1;
    int sum = a + b;
    
    Set<int> opts = {sum};
    while (opts.length < 3) {
      opts.add(r.nextInt(10) + 2);
    }
    options = opts.toList()..shuffle();
  }

  void _answer(int number) {
    if (number == (a + b)) score++;
    
    if (round < totalRounds - 1) {
      setState(() {
        round++;
        _generateRound();
      });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => 
        GameResultScreen(score: score, totalQuestions: totalRounds, onRestart: () {
          setState(() { round = 0; score = 0; _generateRound(); });
        })
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF0E6),
      appBar: AppBar(title: const Text("Addition"), backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$a + $b = ?", style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Color(0xFF3B7EA0))),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: options.map((num) => ElevatedButton(
              onPressed: () => _answer(num),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.white,
              ),
              child: Text("$num", style: const TextStyle(fontSize: 30, color: Colors.black)),
            )).toList(),
          )
        ],
      ),
    );
  }
}