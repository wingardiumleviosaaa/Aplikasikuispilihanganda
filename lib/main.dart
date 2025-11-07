import 'package:flutter/material.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuis Tes Emyu',
      themeMode: ThemeMode.system, // Automatically follows system theme
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'GoogleSans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'GoogleSans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,  // ✅ This is the fix!
        ),
        useMaterial3: true,
      ),
      home: const QuizScreen(),
    );
  }
}