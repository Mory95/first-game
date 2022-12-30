import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(leading: const Text('A propos du jeu')),
            body: const Text('On donne les detailles concernant le jeu')));
  }
}
