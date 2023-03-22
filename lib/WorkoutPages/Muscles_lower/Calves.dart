import 'package:flutter/material.dart';

class Calves extends StatelessWidget {
  const Calves ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calf Workouts'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.black45,
        // Add page content here
      ),
    );
  }
}