import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WrongLettersBox extends StatelessWidget {
  const WrongLettersBox(this.wrongLetters, this.wrongWords, {super.key});

  final List<String> wrongLetters;
  final List<String> wrongWords;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 2, color: Colors.black)),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: wrongLetters.length + wrongWords.length,
            itemBuilder: (context, index) {
              if (index < wrongLetters.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    wrongLetters[index],
                    style: GoogleFonts.syne(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      decoration: TextDecoration.none,
                      shadows: [
                        const Shadow(
                          color: Colors.black,
                          offset: Offset(4, 6),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                final wordIndex = index - wrongLetters.length;
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(wrongWords[wordIndex],
                        style: GoogleFonts.syne(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          decoration: TextDecoration.none,
                          shadows: [
                            const Shadow(
                              color: Colors.black,
                              offset: Offset(4, 6),
                            ),
                          ],
                        )));
              }}));
  }
}
