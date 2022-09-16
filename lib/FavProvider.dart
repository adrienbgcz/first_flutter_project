import 'dart:collection';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavProvider extends ChangeNotifier {
  final List<WordPair> _words = [];

  UnmodifiableListView<WordPair> get getWords => UnmodifiableListView(_words);

  void addWord(WordPair word) {
    if (_words.contains(word)) {
      _words.remove(word);
    } else {
      _words.add(word);
    }
    notifyListeners();
  }

  void removeAll() {
    _words.clear();
  }
}
