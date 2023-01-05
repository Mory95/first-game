import 'package:flutter/material.dart';

class HighScoresScreen extends StatelessWidget {
  HighScoresScreen({super.key});

  final users = [
    {'name': 'Mory Sarr', 'score': '25'},
    {'name': 'Moustrapha Mbaye', 'score': '12'},
    {'name': 'Nafy Ndiaye', 'score': '8'},
    {'name': 'Faly Seck', 'score': '4'},
    {'name': 'Dou', 'score': '25'},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Les meilleurs scords'),
      ),
      // body: const Text('Meilleur scords'),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (((context, index) {
              final name = users[index]['name'];
              final score = users[index]['score'];
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      '$name',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(
                    '$score',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ],
              );
            }))),
      ),
    ));
  }
}
