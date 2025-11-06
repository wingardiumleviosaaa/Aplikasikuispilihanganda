import '../models/question.dart';

final List<Question> questions = [
  Question(
    text: 'What is the capital of France?',
    options: ['Paris', 'London', 'Berlin', 'Madrid'],
    correctIndex: 0,
  ),
  Question(
    text: 'Which planet is known as the Red Planet?',
    options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
    correctIndex: 1,
  ),
  Question(
    text: 'Who developed the theory of relativity?',
    options: ['Newton', 'Einstein', 'Tesla', 'Darwin'],
    correctIndex: 1,
  ),
];
