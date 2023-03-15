import 'package:flutter/material.dart';

class Back_model extends StatelessWidget {
  const Back_model({super.key});

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
                      'assets/image/model_back.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 100,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 200,
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
                // Do something when the back of the model is clicked
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to the muscle groups page
                  Navigator.pop(context);
                },
                child: const Text('Front'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
