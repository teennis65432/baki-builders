import 'package:flutter/material.dart';

class Abs extends StatelessWidget {
  const Abs ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abdominal Workouts'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.black45,
        // Add page content here
      ),
    );
  }
}