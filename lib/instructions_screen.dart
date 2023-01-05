import 'package:flutter/material.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Instructions'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: const Text(
          "C'est un jeu dans le quel on doit cliquer sur un bouton, qui s'affiche au hasard sur l'écran, le max possible dans un délai bien défini(10 secondes). Ce jeu peut vous permettre d'augmenter votre temps de réaction.",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    ));
  }
}
