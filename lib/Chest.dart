import 'package:flutter/material.dart';

class Chest extends StatelessWidget {
  const Chest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chest Workouts'),
      ),
      body: const Center(
        child: Text('This is a new page!'),
      ),
    );
  }
}