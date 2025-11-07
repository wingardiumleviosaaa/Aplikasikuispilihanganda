import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/questions.dart';
import '../providers/theme_provider.dart';
import 'result_screen.dart';
import '../widgets/question_text.dart';
import '../widgets/answer_button.dart';

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

  IconData _getThemeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.brightness_auto;
    }
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Midterm Quiz'),
        actions: [
          IconButton(
            icon: Icon(_getThemeIcon(themeProvider.themeMode)),
            onPressed: () {
              themeProvider.toggleTheme();
            },
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuestionText(text: question.text),
            const SizedBox(height: 24),
            ...List.generate(question.options.length, (index) {
              final isSelected = selectedIndex == index;
              return AnswerButton(
                text: question.options[index],
                isSelected: isSelected,
                onPressed: selectedIndex == null
                    ? () => _selectAnswer(index)
                    : () {},
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