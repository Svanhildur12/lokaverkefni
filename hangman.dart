import 'package:flutter/material.dart';
import 'package:hangman_app/hangman_words.dart';
import 'package:hangman_app/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Hangman extends StatefulWidget {
  const Hangman({super.key});
  @override
  State<Hangman> createState() {
    return _HangmanState();
  }
}

  class _HangmanState extends State<Hangman> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen =const HangmanScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
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
          title: Text(
            'THE HANGMAN APP!',
            style: GoogleFonts.syne(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
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
                  tileMode: TileMode.mirror
              ),
            ),
          child: activeScreen,
        ),
      ),
      );
  }
  }