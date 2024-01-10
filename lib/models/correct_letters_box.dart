import 'package:flutter/material.dart';

class CorrectLettersBox extends StatelessWidget {
  const CorrectLettersBox(this.correctLetters,
      this.wordGuessed,
      this.secretWord,
      this.displayWord,
      this.onNextWordPressed,
      {super.key});

  final List<String> correctLetters;
  final bool wordGuessed;
  final String secretWord;
  final String Function() displayWord;
  final VoidCallback onNextWordPressed;

  @override
  Widget build(BuildContext context) {
    return CorrectLettersBox(
        correctLetters,
        wordGuessed,
        secretWord,
        displayWord,
        onNextWordPressed);
  }
}