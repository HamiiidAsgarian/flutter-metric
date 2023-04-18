import 'package:flutter/material.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("New Tasks"),
          const TextField(),
          Expanded(child: ListView()),
          FloatingActionButton(child: const Text("New Task"), onPressed: () {})
        ],
      )),
    );
  }
}
