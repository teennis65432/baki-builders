import 'package:flutter/material.dart';

class LowerBack extends StatelessWidget {
  const LowerBack ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lower Back Workouts'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.black45,
        // Add page content here
      ),
    );
  }
}