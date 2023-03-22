import 'package:flutter/material.dart';

class Chest extends StatelessWidget {
  const Chest ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chest Workouts'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.black45,
        // Add page content here
      ),
    );
  }
}