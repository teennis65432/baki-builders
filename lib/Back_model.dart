import 'package:flutter/material.dart';
import 'dart:math' as angles;
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
                  // TRAPS BUTTON
                  Positioned(
                    top: 35,
                    left: 90,
                    child: Transform.rotate(
                      angle: 45 * angles.pi / 180,
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(2.0),
                          )
                      ),
                    ),
                  ),
                  // LOWER BACK BUTTON
                  Positioned(
                    top: 165,
                    left: 122,
                    child: Transform.rotate(
                      angle: 45 * angles.pi / 180,
                      child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(2.0),
                          )
                      ),
                    ),
                  ),
                  // LATS BUTTON LEFT
                  Positioned(
                    top: 115,
                    left: 85,
                    child: Transform.rotate(
                      angle: -45 * angles.pi / 180,
                      child: Container(
                          width: 35,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                  ),
                  // LATS BUTTON RIGHT
                  Positioned(
                    top: 115,
                    left: 160,
                    child: Transform.rotate(
                      angle: 45 * angles.pi / 180,
                      child: Container(
                          width: 35,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                  ),
                  // TRICEP BUTTON RIGHT
                  Positioned(
                    top: 100,
                    left: 213,
                    child: Transform.rotate(
                      angle: -25 * angles.pi / 180,
                      child: Container(
                          width: 37,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                  ),
                  // TRICEP BUTTON LEFT
                  Positioned(
                    top: 100,
                    left: 30,
                    child: Transform.rotate(
                      angle: 25 * angles.pi / 180,
                      child: Container(
                          width: 39,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                  ),
                  // CALVES BUTTON RIGHT
                  Positioned(
                    top: 340,
                    left: 170,
                    child: Transform.rotate(
                        angle: -10 * angles.pi / 180,
                      child: Container(
                       width: 45,
                       height: 100,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(20.0),
                        )
                    ),
                  ),
                  ),
                  // CALVES BUTTON LEFT
                  Positioned(
                    top: 340,
                    left: 68,
                    child: Transform.rotate(
                      angle: 10 * angles.pi / 180,
                      child: Container(
                          width: 45,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                  ),
                  // HAMSTRING BUTTON LEFT
                  Positioned(
                    top: 260,
                    left: 80,
                    child: Transform.rotate(
                      angle: 10 * angles.pi / 180,
                      child: Container(
                          width: 50,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15.0),
                          )
                      ),
                    ),
                  ),
                  // HAMSTRING BUTTON RIGHT
                  Positioned(
                    top: 260,
                    left: 155,
                    child: Transform.rotate(
                      angle: -10 * angles.pi / 180,
                      child: Container(
                          width: 50,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15.0),
                          )
                      ),
                    ),
                  ),
                  // GLUTES BUTTON
                  Positioned(
                    top: 210,
                    left: 90,
                    child: Container(
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                      color: Colors.yellow,
                        borderRadius: BorderRadius.circular(40.0),
                      )
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Set the button color to orange
                ),
                child: const Text('View Front'),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
