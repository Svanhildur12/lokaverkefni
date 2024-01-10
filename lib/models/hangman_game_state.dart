class HangmanGameState {
  List<String> correctGuesses = [];
  List<String> wrongGuesses = [];

  void addCorrectGuess(String guess) {
    if(!correctGuesses.contains(guess)) {
      correctGuesses.add(guess);
    }
  }
}