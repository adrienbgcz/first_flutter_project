import 'package:english_words/english_words.dart';
import 'package:first_project/FavProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite Page"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Consumer<FavProvider>(
          builder: (context, fav, child) {
            return ListView.builder(
              itemCount: fav.getWords.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(fav.getWords[index].asString),
                  leading: IconButton(
                    icon: Icon(Icons.favorite,color: Colors.red),
                    onPressed: () => fav.addWord(fav.getWords[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
