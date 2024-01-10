import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hangman_app/models/hangman_game_state.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.gameState});

  final HangmanGameState gameState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.black],
                  begin: Alignment.center,
                  end: Alignment.centerLeft,
                  tileMode: TileMode.mirror),
            ),
            child: AppBar(
              title: Text(
                'The Results Screen',
                style: GoogleFonts.syne(
                    backgroundColor: Colors.transparent,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.black],
                  begin: Alignment.center,
                  end: Alignment.centerLeft,
                  tileMode: TileMode.mirror),
            ),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const SizedBox(height: 25),
                  Text(
                    'List of words guessed:',
                    style: GoogleFonts.syne(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: gameState.correctGuesses.length,
                          itemBuilder: (context, index) {
                            final guess = gameState.correctGuesses[index];
                            return ListTile(
                                title: Text(
                              guess,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.syne(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14),
                            ));
                          })),
                  const SizedBox(height: 25),
                ]))));
  }
}
