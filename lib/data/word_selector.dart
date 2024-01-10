import 'dart:math';

class WordSelector {
  final List<String> wordList;
  final List<String> selectedWords = [];

  WordSelector(this.wordList);

  String selectRandom() {
    if (wordList.isEmpty) {
      throw Exception('word list is empty');
    }

    final List<String> availableWords =
        (wordList.where((word) => !selectedWords.contains(word))).toList();

    if (availableWords.isEmpty) {
      selectedWords.clear();
    }

    final random = Random();
    final selectedWord = availableWords[random.nextInt(availableWords.length)];

    selectedWords.add(selectedWord);
    return selectedWord;
  }
}

void main() {
  final wordList = <String>[
    'Apple',
    'Banana',
    'Carrot',
    'Dog',
    'Elephant',
    'Frog',
    'Guitar',
    'House',
    'Igloo',
    'Jump',
    'Kite',
    'Lemon',
    'Monkey',
    'Notebook',
    'Orange',
    'Penguin',
    'Quilt',
    'Rainbow',
    'Sunflower',
    'Turtle',
    'Cat',
    'Human',
    'Car',
    'Lamp',
    'Mountain',
    'Telescope',
    'Symphony',
    'Paradox',
    'Galaxy',
    'Aquamarine',
    'Labyrinth',
    'Harmony',
  ];
  final wordSelector = WordSelector(wordList);

  for (int i = 0; i < 10; i++) {
    final selectedWord = wordSelector.selectRandom();
  }
}
