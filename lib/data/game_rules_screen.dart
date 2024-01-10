import 'package:flutter/material.dart';
import 'package:hangman_app/models/hangman_game_state.dart';

class GameRulesScreen extends StatelessWidget {
  const GameRulesScreen({
    required this.onGameRulesPressed,
    required this.onBack,
    required this.gameState,
    required this.onStartGamePressed,
    super.key,
  });

  final VoidCallback onBack;
  final void Function() onGameRulesPressed;
  final HangmanGameState gameState;
  final void Function() onStartGamePressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.black,
                ],
                begin: Alignment.center,
                end: Alignment.centerLeft,
                tileMode: TileMode.mirror),
          ),
        ),
        title: const Text(
          'How To Play',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontSize: 36,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.black,
              ],
              begin: Alignment.center,
              end: Alignment.centerLeft,
              tileMode: TileMode.mirror),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                const Text(
                  '\n\n\nJust follow the steps below',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 45),
                const Text(
                  'Select the letter you think is right.\n'
                  'if letter is correct it appears in the lines above the letters.\n'
                  'if letter is wrong it will appear in a box below the image and the drawing starts.\n'
                  'if the man hangs before you answer correctly, you lose.\n'
                  'if you answer correctly before the man hangs, you win!\n\n\n\n\n\n\n'
                  'Good luck.\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    onPressed: onStartGamePressed,
                    icon: const Icon(Icons.play_arrow_sharp),
                    label: const Text('Play Game'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
