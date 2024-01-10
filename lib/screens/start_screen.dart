import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hangman_app/models/hangman_game_state.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
      {super.key,
      required this.onGameRulesPressed,
      required this.onStartGamePressed,
      required this.gameState});

  final void Function() onGameRulesPressed;
  final void Function() onStartGamePressed;
  final HangmanGameState gameState;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'lib/assets/noose.png',
            width: 350,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 80),
          Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 5.0,
            child: ElevatedButton.icon(
              onPressed: onStartGamePressed,
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('START GAME'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                fixedSize: const Size(250, 50),
                backgroundColor: Colors.red,
                textStyle: GoogleFonts.syne(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 5,
            child: ElevatedButton.icon(
              onPressed: onGameRulesPressed,
              icon: const Icon(Icons.help_outline),
              label: const Text('GAME RULES'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.orange,
                fixedSize: const Size(200, 15),
                backgroundColor: Colors.red,
                textStyle: GoogleFonts.syne(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
