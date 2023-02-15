import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Container(
            padding: const EdgeInsets.only(top: 25),
            //adds space from top to prevent overlapping with notification bar
            color: Colors.orange,// makes drawer color orange
            child: Column(//creates column
              children: [// creates multiple children cases for the multiple button/clickable tiles
                ListTile(
                  leading: const Icon(Icons.login, color: Colors.black),
                  title: const Text('Login'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                      Icons.account_circle, color: Colors.black),
                  title: const Text('Account'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                      Icons.fitness_center, color: Colors.black),
                  title: const Text('Muscle Groups'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                      Icons.collections_bookmark, color: Colors.black),
                  title: const Text('Workout Plans'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                      Icons.play_circle_fill, color: Colors.black),
                  title: const Text('Music Playlist'),
                  onTap: () {},
                ),
              ],// end of children cases
            ),
          ),
        );
  }}
