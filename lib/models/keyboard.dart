import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Keyboard extends StatelessWidget {
  const Keyboard(
      {super.key,
      required this.disabledLetters,
      required this.onLetterPressed,
      required this.correctLetters});

  final Function(String) onLetterPressed;
  final List<String> correctLetters;
  final List<String> disabledLetters;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(
        26,
        (index) {
          String letter = String.fromCharCode('A'.codeUnitAt(0) + index);
          bool isCorrect = correctLetters.contains(letter);

          return ElevatedButton(
            key: Key(letter),
            onPressed: disabledLetters.contains(letter)
                ? null
                : () {
                    onLetterPressed(letter);
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: isCorrect ? Colors.green : Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
              side: const BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
              elevation: 5,
              shape: const CircleBorder(eccentricity: 0.2),
              textStyle: GoogleFonts.syne(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            child: Text(
              letter,
              style: TextStyle(
                color: isCorrect ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          );
        },
      ),
    );
  }
}
