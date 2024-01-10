import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hangman_app/models/hangman_game_state.dart';

class HangmanUI extends StatelessWidget {
  const HangmanUI(
      {super.key,
        required this.activeScreen,
        required this.gameState,
        required this.onGameRulesPressed
      });

  final Widget? activeScreen;
  final VoidCallback onGameRulesPressed;
  final HangmanGameState gameState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildThemeData(),
      home: Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(),
      ),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      appBarTheme:const AppBarTheme(
        backgroundColor: Colors.transparent
      ),
      primaryTextTheme: TextTheme(
        headlineMedium: GoogleFonts.syne(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.bold
        )
      )
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'THE HANGMAN APP!',
        style: GoogleFonts.syne(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold
        )
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red, Colors.black],
            begin: Alignment.center,
            end: Alignment.centerLeft,
            tileMode: TileMode.mirror
          ),
        ),
      ),
    );
  }

  Container buildBody() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.red, Colors.black],
            begin: Alignment.center,
            end: Alignment.centerLeft,
            tileMode: TileMode.mirror),
      ),
      child: activeScreen,
    );
  }
}