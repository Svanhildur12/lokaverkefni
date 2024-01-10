import 'package:flutter/material.dart';
import 'package:hangman_app/models/wrong_letters_box.dart';

import 'keyboard.dart';

class HangmanBox extends StatefulWidget {
  const HangmanBox(
      this.incorrectAttempts,
      this.getCurrentHangmanImage,
      this.wrongLetters,
      this.wordGuessed,
      this.secretWord,
      this.displayWord,
      this.selectRandomWord,
      this.onLetterPressed,
      this.getCorrectLetters,
      this.keyboard,
      this.wrongWords,
      {super.key});

  final int incorrectAttempts;
  final String Function() getCurrentHangmanImage;
  final List<String> wrongLetters;
  final bool wordGuessed;
  final String secretWord;
  final String Function() displayWord;
  final VoidCallback selectRandomWord;
  final Function(String) onLetterPressed;
  final List<String> Function() getCorrectLetters;
  final Widget keyboard;
  final List<String> wrongWords;

  @override
  State<HangmanBox> createState() {
    return HangmanBoxState();
  }
}

class HangmanBoxState extends State<HangmanBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.getCurrentHangmanImage(),
              height: 295,
            ),
            const SizedBox(height: 15),
            WrongLettersBox(widget.wrongLetters, widget.wrongWords),
            const SizedBox(height: 15),
            Keyboard(
              disabledLetters: widget.wrongLetters,
              onLetterPressed: widget.onLetterPressed,
              correctLetters: widget.getCorrectLetters(),
            ),
          ],
        ),
      ),
    );
  }
}
