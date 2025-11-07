import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Your Result')),
      body: Center(
        // Wrap your layout with SingleChildScrollView
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/tick.png',
                  width: 120,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.25,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Quiz Completed!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Text(
                  'Your Score: $score / $totalQuestions',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: onRestart,
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Restart Quiz'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}