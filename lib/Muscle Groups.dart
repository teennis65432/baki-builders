import 'package:flutter/material.dart';
import 'dart:math' as num;
import 'Back_model.dart';
import 'WorkoutPages/Muscles_core/Abs.dart';
import 'WorkoutPages/Muscles_back/LatissimusDorsi.dart';
import 'WorkoutPages/Muscles_back/LowerBack.dart';
import 'WorkoutPages/Muscles_back/Trapezius.dart';
import 'WorkoutPages/Muscles_core/Obliques.dart';
import 'WorkoutPages/Muscles_lower/Calves.dart';
import 'WorkoutPages/Muscles_lower/Glutes.dart';
import 'WorkoutPages/Muscles_lower/Hamstrings.dart';
import 'WorkoutPages/Muscles_lower/Quadriceps.dart';
import 'WorkoutPages/Muscles_upper/Biceps.dart';
import 'WorkoutPages/Muscles_upper/Chest.dart';
import 'WorkoutPages/Muscles_upper/Forearms.dart';
import 'WorkoutPages/Muscles_upper/Shoulders.dart';
import 'WorkoutPages/Muscles_upper/Triceps.dart';


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
                    top: 128,
                    left: 105,
                    child: Container(
                      width: 50,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0), // Set the border radius to 10
                      ),
                    ),
                  ),
                  Positioned(
                    top: 300,
                    left: 200,
                    child: Transform.rotate(
                      angle: 45 * num.pi / 180, // Set the rotation angle to 45 degrees
                      child: Container(
                        width: 45,
                        height: 95,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),


                  // Add more Positioned widgets for other clickable parts of the image
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Abs()),
                );

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
    );
  }
}
