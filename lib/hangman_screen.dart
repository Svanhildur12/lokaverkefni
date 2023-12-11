import 'package:hangman_app/data/word_list.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hangman_app/keyboard.dart';

class HangmanScreen extends StatefulWidget {
  const HangmanScreen({super.key});

  @override
  State<HangmanScreen> createState() {
    return _HangmanScreenState();
  }
}

class _HangmanScreenState extends State<HangmanScreen> {
  String secretWord = '';
  List<bool> guessedLetters = [];
  int incorrectAttempts = 0;

  @override
  void initState() {
    super.initState();
    selectRandomWord();
  }

  void selectRandomWord() {
    final Random random = Random();
    secretWord = wordList[random.nextInt(wordList.length)];
    guessedLetters = List.generate(secretWord.length, (index) => false);
    incorrectAttempts = 0;
  }

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
              'lib/assets/frame.png',
              height: 295,
            ),
            Container(
            ),
            const SizedBox(
                height: 20
            ),
            Text(
              displayWord(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Keyboard(onLetterPressed: onLetterPressed),
          ],
        ),
      ),
    );
  }

  String displayWord() {
    String display = '';
    for (int i = 0; i < secretWord.length; i++) {
      display += guessedLetters[i] ? secretWord[i] : '_';
      display += ' ';
    }
    return display.trim();
  }

  void onLetterPressed(String letter) {
    setState(() {
      if (secretWord.contains(letter)) {
        for (int i = 0; i < secretWord.length; i++) {
          if (secretWord[i] == letter) {
            guessedLetters[i] = true;
          }
        }
      } else {
        incorrectAttempts++;
      }
      if (guessedLetters.every((letter) => letter) ||
          incorrectAttempts >= 7) {
        selectRandomWord();
      }
    });
  }
}


