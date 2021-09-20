import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomPairs = <WordPair>[];
  final _savedPairs = Set<WordPair>();

  Widget _buildList() {
    return ListView.builder(itemBuilder: (context, item) {
      if (item.isOdd) {
        return Divider();
      }

      final index = item ~/ 2;

      if (index >= _randomPairs.length) {
        _randomPairs.addAll(generateWordPairs().take(10));
      }

      return _buildRow(_randomPairs[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final isSaved = _savedPairs.contains(pair);

    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18)),
        trailing: Icon(isSaved ? Icons.favorite : Icons.favorite_border,
            color: isSaved ? Colors.red : null),
        onTap: () {
          setState(() => {
            if (isSaved) 
              _savedPairs.remove(pair) 
            else 
              _savedPairs.add(pair)
          });
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WordPair Genarator'),
          backgroundColor: Colors.green,
        ),
        body: _buildList());
  }
}
