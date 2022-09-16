import 'package:english_words/english_words.dart';
import 'package:first_project/FavProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favoritepage.dart';

class RandomWord extends StatelessWidget {
  RandomWord({Key? key}) : super(key: key);

  final List<WordPair> _suggestions = [];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

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
                    builder: (context) => FavoritePage(),
                  ),
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
        bool alreadySaved = Provider.of<FavProvider>(context,listen: true).getWords.contains(_suggestions[index]);
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
          trailing: IconButton(
              onPressed: () {
                Provider.of<FavProvider>(context,listen: false).addWord(_suggestions[index]);
              },
              icon: alreadySaved
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite_border, color: Colors.black)),
        );
      },
    );
  }
}
