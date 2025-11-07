import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String text;

  const QuestionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'GoogleSans',
        fontSize: MediaQuery.of(context).size.width * 0.05,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
