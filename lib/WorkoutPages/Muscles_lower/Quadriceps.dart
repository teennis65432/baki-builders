import 'package:flutter/material.dart';

class Quadriceps extends StatelessWidget {
  const Quadriceps ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quad Workouts'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.black45,
        // Add page content here
      ),
    );
  }
}