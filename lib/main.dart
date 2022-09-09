import 'package:first_project/favoritepage.dart';
import 'package:first_project/randomword.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  /*runApp(const MyApp(saved: []));*/
  runApp(const MyNewApp());
}

/*class MyApp extends StatelessWidget { // stateless = pas de changements dans l'interface
  const MyApp({super.key, required this.saved});
  final List<WordPair> saved;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const RandomWord(saved: [],),

        ),
      );
  }
}*/

class MyNewApp extends StatefulWidget {
  const MyNewApp({Key? key}) : super(key: key);

  @override
  State<MyNewApp> createState() => _MyNewAppState();
}

class _MyNewAppState extends State<MyNewApp> {
  List<WordPair> favorite = [];
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: RandomWord(saved: favorite, callback: addFavorite),

      ),
    );
  }

  void addFavorite({required WordPair word}) {
    setState(() {
      if (!favorite.contains(word)) {
        favorite.add(word);
      } else {
        favorite.remove(word);
      }
    });

    print(favorite.length);
  }
}

