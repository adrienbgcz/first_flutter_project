import 'package:first_project/favoritepage.dart';
import 'package:first_project/randomword.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  // runApp(const MyApp(saved: []));
  runApp(const MyNewApp());
}

class MyNewApp extends StatefulWidget {
  const MyNewApp({super.key});

  @override
  State<MyNewApp> createState() => _MyNewAppState();
}

class _MyNewAppState extends State<MyNewApp> {
  List<WordPair> favorites = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: RandomWord(
          saved: favorites,
          callback: addFavorite,
        ),
      ),
    );
  }

  void addFavorite({required WordPair word}) {
    setState(() {
      if (!favorites.contains(word)) {
        favorites.add(word);
      } else {
        favorites.remove(word);
      }
    });
    print(favorites.length);
  }
}

// class MyApp extends StatelessWidget { // stateless = pas de changements dans l'interface
//   const MyApp({super.key, required this.saved});
//   final List<WordPair> saved;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Welcome to Flutter'),
//         ),
//         body: const RandomWord(saved: [],),

//         ),
//       );
//   }
// }
