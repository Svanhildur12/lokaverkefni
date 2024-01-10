import 'package:flutter/material.dart';
import 'package:hangman_app/data/game_rules_screen.dart';
import 'package:hangman_app/hangman_ui.dart';
import 'package:hangman_app/models/hangman_game_state.dart';
import 'package:hangman_app/screens/hangman_screen.dart';
import 'package:hangman_app/screens/start_screen.dart';

class Hangman extends StatefulWidget {
  const Hangman({super.key});

  @override
  State<Hangman> createState() {
    return _HangmanState();
  }
}

class _HangmanState extends State<Hangman> {
  late HangmanGameState gameState;
  Widget? activeScreen;

  @override
  void initState() {
    gameState = HangmanGameState();
    activeScreen = StartScreen(
        onGameRulesPressed: switchToGameRules,
        onStartGamePressed: switchToHangmanScreen,
        gameState: gameState);
    super.initState();
  }

  void switchToHangmanScreen() {
    setState(() {
      activeScreen = HangmanScreen(
        onStartGamePressed: switchToHangmanScreen,
        gameState: gameState,
        onResultPressed: switchToResultsScreen,
      );
    });
  }

  void switchToResultsScreen() {
    setState(() {
      activeScreen = HangmanScreen(
          onStartGamePressed: switchToHangmanScreen,
          onResultPressed: switchToResultsScreen,
          gameState: gameState);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = StartScreen(
          onGameRulesPressed: switchToGameRules,
          onStartGamePressed: switchToHangmanScreen,
          gameState: gameState);
    });
  }

  void switchToGameRules() {
    setState(() {
      activeScreen = GameRulesScreen(
        onBack: switchScreen,
        onGameRulesPressed: switchToGameRules,
        gameState: gameState,
        onStartGamePressed: switchToHangmanScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return HangmanUI(
        activeScreen: activeScreen,
        onGameRulesPressed: switchToGameRules,
        gameState: gameState);
  }
}
