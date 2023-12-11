import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key, required this.onLetterPressed});

  final Function(String) onLetterPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(26, (index) {
      String letter = String.fromCharCode('A'.codeUnitAt(0) + index);
      return ElevatedButton(
        key: Key(letter),
        onPressed: () {
          onLetterPressed(letter);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
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
        child: Text(letter),
      );
    },),);
    }
  }