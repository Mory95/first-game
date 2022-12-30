import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final element = [
    {'libelle': 'Nouvelle partie', 'route': 'game'},
    {'libelle': 'Records', 'route': 'records'},
    {'libelle': 'Instruction', 'route': 'instructions'},
    {'libelle': 'Paramétre', 'route': 'parametre'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nom du jeux')),
      body: Center(
        child: ListView.builder(
            itemCount: element.length,
            itemBuilder: ((context, index) {
              final lib = element[index]['libelle'];
              final route = element[index]['route'];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/$route');
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      '$lib',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              );
            })),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => SystemNavigator.pop(),
      //   child: const Icon(Icons.exit_to_app),
      // ),
    );
  }
}
