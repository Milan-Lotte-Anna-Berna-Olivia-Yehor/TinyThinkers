import 'package:flutter/material.dart';

class TracingGameScreen extends StatefulWidget {
  const TracingGameScreen({super.key});

  @override
  State<TracingGameScreen> createState() => _TracingGameScreenState();
}

class _TracingGameScreenState extends State<TracingGameScreen> {
  // Ukladáme body, ktoré používateľ nakreslil
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trace the Letter"),
        backgroundColor: Colors.green[100],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, size: 30),
            onPressed: () => setState(() => points.clear()), // Vymazať
            tooltip: "Clear Board",
          )
        ],
      ),
      body: Stack(
        children: [
          // 1. Pozadie - Písmeno na obkreslenie
          Center(
            child: Text(
              "A",
              style: TextStyle(
                fontSize: 400,
                color: Colors.grey.withOpacity(0.3), // Jemná farba
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // 2. Interaktívna plocha na kreslenie
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                points.add(renderBox.globalToLocal(details.globalPosition));
              });
            },
            onPanEnd: (details) {
              points.add(null); // Ukončenie ťahu
            },
            child: CustomPaint(
              painter: DrawingPainter(points),
              size: Size.infinite,
            ),
          ),
          
          // 3. Info text dole
          const Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Trace with your finger!",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Maliar, ktorý vykresľuje body na obrazovku
class DrawingPainter extends CustomPainter {
  final List<Offset?> points;
  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 15.0; // Hrúbka čiary

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}