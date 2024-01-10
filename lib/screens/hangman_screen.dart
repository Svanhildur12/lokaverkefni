import 'package:google_fonts/google_fonts.dart';
import 'package:hangman_app/data/word_list.dart';
import 'package:hangman_app/data/image_list.dart';
import 'package:flutter/material.dart';
import 'package:hangman_app/data/word_selector.dart';
import 'package:hangman_app/models/correct_letters_box.dart';
import 'package:hangman_app/models/hangman_game_state.dart';
import 'package:hangman_app/models/wrong_letters_box.dart';
import 'package:hangman_app/models/keyboard.dart';
import 'package:hangman_app/screens/results_screen.dart';

class HangmanScreen extends StatefulWidget {
  const HangmanScreen(
      {super.key,
      required this.onStartGamePressed,
      required this.onResultPressed,
      required this.gameState});

  final void Function() onStartGamePressed;
  final void Function() onResultPressed;
  final HangmanGameState gameState;

  @override
  State<HangmanScreen> createState() {
    return _HangmanScreenState();
  }
}

class _HangmanScreenState extends State<HangmanScreen> {
  String secretWord = '';
  late HangmanGameState gameState;
  List<bool> guessedLetters = [];
  List<String> wrongLetters = [];
  int incorrectAttempts = 0;
  bool wordGuessed = true;
  bool showNextWordButton = false;
  late WordSelector wordSelector;
  List<String> correctGuesses = [];
  List<String> wrongGuesses = [];
  late List<String> wrongWords;

  void onWordGuessed() {
    setState(() {
      wordGuessed = false;
      showNextWordButton = true;
    });
  }

  void onNextWordPressed() {
    setState(() {
      if (showNextWordButton) {
        wordGuessed = true;
        selectRandomWord();
        showNextWordButton = true;
      }
    });
  }

  void onResultPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(gameState: gameState),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    gameState = widget.gameState;
    wordSelector = WordSelector(wordList);
    wrongWords = [];
    selectRandomWord();
  }

  void selectRandomWord() {
    setState(() {
      secretWord = wordSelector.selectRandom().toUpperCase();
      guessedLetters = List.generate(secretWord.length, (index) => false);
      wrongLetters = [];
      incorrectAttempts = 0;
      wordGuessed = false;
      correctGuesses = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    getCurrentHangmanImage(),
                    height: 295,
                  ),
                  const SizedBox(height: 15),
                  WrongLettersBox(wrongLetters, wrongWords),
                  const SizedBox(height: 15),
                  Text(
                    wordGuessed ? 'Guessed Word: $secretWord' : displayWord(),
                    style: GoogleFonts.syne(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        shadows: [
                          const Shadow(
                            color: Colors.white,
                            offset: Offset(-1, -1),
                          ),
                          const Shadow(
                            color: Colors.white,
                            offset: Offset(1, -1),
                          ),
                          const Shadow(
                            color: Colors.white,
                            offset: Offset(-1, 1),
                          ),
                          const Shadow(
                            color: Colors.white,
                            offset: Offset(1, 1),
                          ),
                        ]),
                  ),
                  const SizedBox(height: 15),
                  if (wordGuessed)
                    Column(
                      children: [
                        CorrectLettersBox(getCorrectLetters(), wordGuessed,
                            secretWord, displayWord, onNextWordPressed),
                      ],
                    ),
                  Keyboard(
                      disabledLetters: wrongLetters,
                      onLetterPressed: onLetterPressed,
                      correctLetters: getCorrectLetters()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (showNextWordButton)
                        ElevatedButton(
                          onPressed: onNextWordPressed,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.deepOrange,
                              padding: const EdgeInsets.all(20),
                              side: const BorderSide(
                                color: Colors.deepOrange,
                                width: 2,
                              ),
                              alignment: Alignment.bottomLeft,
                              elevation: 5,
                              textStyle: GoogleFonts.syne(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )),
                          child: const Text('Next Word'),
                        ),
                      ElevatedButton(
                        onPressed: onResultPressed,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.deepOrange,
                            padding: const EdgeInsets.all(20),
                            side: const BorderSide(
                              color: Colors.deepOrange,
                              width: 2,
                            ),
                            alignment: Alignment.bottomRight,
                            elevation: 5,
                            textStyle: GoogleFonts.syne(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            )),
                        child: const Text('RESULT'),
                      ),
                    ],
                  ),
                ])));
  }

  List<String> getCorrectLetters() {
    List<String> correctLettersList = [];
    for (int i = 0; i < secretWord.length; i++) {
      if (guessedLetters[i]) {
        correctLettersList.add(secretWord[i]);
      }
    }
    return correctLettersList;
  }

  String displayWord() {
    String display = '';
    for (int i = 0; i < secretWord.length; i++) {
      display += guessedLetters[i] ? secretWord[i].toUpperCase() : '_';
      display += ' ';
    }
    return display.trim();
  }

  String getCurrentHangmanImage() {
    int imageIndex = wrongLetters.length;
    if (imageIndex >= hangmanImages.length) {
      imageIndex = hangmanImages.length - 1;
    } else if (imageIndex < 0) {
      imageIndex = 0;
    }
    return hangmanImages[imageIndex];
  }

  void onLetterPressed(String letter) {
    setState(() {
      if (secretWord.contains(letter)) {
        for (int i = 0; i < secretWord.length; i++) {
          if (secretWord[i] == letter) {
            guessedLetters[i] = true;
          }
        }
        if (guessedLetters.every((letter) => letter)) {
          if (!correctGuesses.contains(secretWord)) {
            correctGuesses.add(secretWord);
            widget.gameState.addCorrectGuess(secretWord);
          }
          onWordGuessed();
        }
      } else {
        if (!wrongLetters.contains(letter)) {
          wrongLetters.add(letter);
        }
        incorrectAttempts++;
      }
      if (wordGuessed || incorrectAttempts >= 7) {
        selectRandomWord();
      }
    });
  }
}
