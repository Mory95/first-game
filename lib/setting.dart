import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int status = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Paramétre'),
      ),
      body: Column(
        children: [
          const Center(
              child: Text(
            'Selectionner la durée des parties',
            style: TextStyle(fontSize: 20.0),
          )),
          const Divider(),
          RadioListTile(
            title: Text("10"),
            value: 0,
            groupValue: status,
            onChanged: (value) {
              setState(() {
                status = value!;
              });
            },
          ),
          RadioListTile(
            title: Text("15"),
            value: 1,
            groupValue: status,
            onChanged: (value) {
              setState(() {
                status = value!;
              });
            },
          ),
          RadioListTile(
            title: Text("20"),
            value: 2,
            groupValue: status,
            onChanged: (value) {
              setState(() {
                status = value!;
              });
            },
          )
        ],
      ),
    ));
  }
}
