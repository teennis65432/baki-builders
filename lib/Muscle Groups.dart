import 'package:flutter/material.dart';

import 'Back_model.dart';
import 'Chest.dart';

class MuscleGroups extends StatelessWidget {
  const MuscleGroups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muscle Groups'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click on the muscle group you want to work on:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: Stack(
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/image/model_front.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 165,
                    left: 115,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.green,
                    ),
                  ),

                  // Add more Positioned widgets for other clickable parts of the image
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Chest()),
                );
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the Back_model screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Back_model()),
                  );
                },
                child: const Text('View Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
