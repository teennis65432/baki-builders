import 'package:flutter/material.dart';
import 'dart:math' as num;
import 'Back_model.dart';
import 'WorkoutPages/Muscles_core/Abs.dart';
import 'WorkoutPages/Muscles_back/Trapezius.dart';
import 'WorkoutPages/Muscles_core/Obliques.dart';
import 'WorkoutPages/Muscles_lower/Calves.dart';
import 'WorkoutPages/Muscles_lower/Quadriceps.dart';
import 'WorkoutPages/Muscles_upper/Biceps.dart';
import 'WorkoutPages/Muscles_upper/Chest.dart';
import 'WorkoutPages/Muscles_upper/Forearms.dart';
import 'WorkoutPages/Muscles_upper/Shoulders.dart';


class MuscleGroups extends StatelessWidget {
  const MuscleGroups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muscle Groups'),
      ),
        body: SingleChildScrollView( //allows scrolling if image doesnt resize
        child: Center(
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
                  // ABS BUTTON
                  Positioned(
                    top: 128,
                    left: 105,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Abs()
                        )
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0), // Set the border radius to 10
                        ),
                      ),
                    ),
                  ),
                  // TRAPS BUTTON LEFT
                  Positioned(
                    top: 55,
                    left: 80,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Trapezius()
                        )
                        );
                      },
                      child: Container(
                        width: 110,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25.0), // Set the border radius to 10
                        ),
                      ),
                    ),
                  ),
                  // CHEST BUTTON
                  Positioned(
                    top: 85,
                    left: 80,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Chest()
                        )
                        );
                      },
                      child: Container(
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0), // Set the border radius to 10
                        ),
                      ),
                    ),
                  ),
                  // SHOULDER BUTTON LEFT
                  Positioned(
                    top: 80,
                    left: 40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Shoulders()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: 25 * num.pi / 180,
                        child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                      ),
                    ),
                  ),
                  // SHOULDER BUTTON RIGHT
                  Positioned(
                    top: 80,
                    left: 190,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Shoulders()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: 25 * num.pi / 180,
                        child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                      ),
                    ),
                  ),
                  // BICEPS BUTTON LEFT
                  Positioned(
                    top: 120,
                    left: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Biceps()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: 25 * num.pi / 180,
                        child: Container(
                            width: 35,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                      ),
                    ),
                  ),
                  // BICEPS BUTTON RIGHT
                  Positioned(
                    top: 120,
                    left: 210,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Biceps()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: -25 * num.pi / 180,
                        child: Container(
                            width: 35,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                      ),
                    ),
                  ),
                  // FOREARM BUTTON RIGHT
                  Positioned(
                    top: 172,
                    left: 235,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Forearms()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: -25 * num.pi / 180,
                        child: Container(
                            width: 30,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                            )
                        ),
                      ),
                    ),
                  ),
                  // FOREARM BUTTON LEFT
                  Positioned(
                    top: 172,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Forearms()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: 25 * num.pi / 180,
                        child: Container(
                            width: 33,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                            )
                        ),
                      ),
                    ),
                  ),
                  // OBLIQUES BUTTON RIGHT
                  Positioned(
                    top: 125,
                    left: 160,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Obliques()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: 25 * num.pi / 180,
                        child: Container(
                            width: 35,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                      ),
                    ),
                  ),
                  // OBLIQUES BUTTON LEFT
                  Positioned(
                    top: 125,
                    left: 80,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Obliques()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: -15 * num.pi / 180,
                        child: Container(
                            width: 20,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                      ),
                    ),
                  ),
                  // QUADS BUTTON RIGHT
                  Positioned(
                    top: 240,
                    left: 145,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Quadriceps()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: -10 * num.pi / 180,
                        child: Container(
                            width: 50,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                      ),
                    ),
                  ),
                  // QUADS BUTTON LEFT
                  Positioned(
                    top: 240,
                    left: 73,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Quadriceps()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: 10 * num.pi / 180,
                        child: Container(
                            width: 50,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                      ),
                    ),
                  ),
                  // CALVES BUTTON RIGHT
                  Positioned(
                    top: 340,
                    left: 75,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Calves()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: 10 * num.pi / 180, // Set the rotation angle to 45 degrees
                        child: Container(
                          width: 35,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // CALVES BUTTON LEFT
                  Positioned(
                    top: 340,
                    left: 165,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Calves()
                        )
                        );
                      },
                      child: Transform.rotate(
                        angle: -10 * num.pi / 180,
                        child: Container(
                            width: 35,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25.0),
                            )
                        ),
                      ),
                    ),
                  ),
                  // Add more Positioned widgets for other clickable parts of the image
                ],
              ),
              onTap: () {

              },
            ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Set the button color to orange
                ),
                child: const Text('View Back'),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
