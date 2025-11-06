import 'package:flutter/material.dart';
import '../data/questions.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int? selectedIndex;
  int score = 0;
  bool isCompleted = false;

  void _selectAnswer(int index) {
    setState(() {
      selectedIndex = index;
      if (index == questions[currentIndex].correctIndex) {
        score++;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ Correct!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('❌ Wrong answer!')),
        );
      }
    });
  }

  void _nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null;
      });
    } else {
      setState(() {
        isCompleted = true;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      currentIndex = 0;
      score = 0;
      selectedIndex = null;
      isCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isCompleted) {
      return ResultScreen(
        score: score,
        totalQuestions: questions.length,
        onRestart: _restartQuiz,
      );
    }

    final question = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Midterm Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ...List.generate(question.options.length, (index) {
              final isSelected = selectedIndex == index;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected
                        ? Colors.blueAccent
                        : Colors.blueGrey.shade100,
                  ),
                  onPressed: selectedIndex == null
                      ? () => _selectAnswer(index)
                      : null,
                  child: Text(question.options[index]),
                ),
              );
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedIndex != null ? _nextQuestion : null,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
