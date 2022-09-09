import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'favoritepage.dart';

class RandomWord extends StatefulWidget {
  final Function callback;
  const RandomWord({Key? key, required this.saved, required this.callback}) : super(key: key);
  final List<WordPair> saved;

  @override
  State<RandomWord> createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  List<WordPair> _suggestions = [];
  TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i == 0) {
          return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FavoritePage(saved: widget.saved, callback: widget.callback)),
                );
              },
              child: Text("BTN"));
        }
        if (i.isOdd) return const Divider();
        /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        bool alreadySaved =
            widget.saved.contains(_suggestions[index]); // widget si stateful
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
          trailing: IconButton(
              onPressed: () {
                print("Je clique sur le boutton ${_suggestions[index]}");
                /*addFavorite(_suggestions[index]);*/
                widget.callback(word:_suggestions[index]);
              },
              icon: alreadySaved ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border, color: Colors.black)),
        );
      },
    );
  }
}
