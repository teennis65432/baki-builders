import 'package:flutter/material.dart';
import 'AccountPage.dart';
import 'Muscle Groups.dart';
import 'Music Playlist.dart';
import 'Workout Plans.dart';
import 'loginPage.dart';

import 'package:firebase_auth/firebase_auth.dart';

String accountText = 'Login/SignUp';
bool isLoggedIn = false;

class DrawerWidget extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    if (user != null) {
      accountText = 'Account';
      isLoggedIn = true;
    }
    else {
      accountText = 'Login/SignUp';
      isLoggedIn = false;
    }

    return Drawer(
          child: Container(
            padding: const EdgeInsets.only(top: 45),
            //adds space from top to prevent overlapping with notification bar
            color: Colors.orange,// makes drawer color orange
            child: Column(//creates column
              children: [// creates multiple children cases for the multiple button/clickable tiles
                ListTile(
                  leading: const Icon(Icons.login, color: Colors.black),
                  title:  Text(accountText),
                  onTap: () {
                    if (accountText == 'Login/SignUp') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    } else {
                      //this gives a logged in use the ability to log out as well without showing the account page in the drawer initially
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
                    }

                  },
                ),
                 ListTile(
                         leading: const Icon(Icons.home, color: Colors.black),
                         title: const Text('Home'),
                          onTap: () {
                         // Navigate back to the existing main page
                                 Navigator.popUntil(context, (route) => route.isFirst);
                       },
                  ),

                ListTile(
                  leading: const Icon(Icons.fitness_center, color: Colors.black),
                  title: const Text('Muscle Groups'),
                  onTap: () {
                    // Navigate to the home page when the tile is tapped
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Muscle_Groups())
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.collections_bookmark, color: Colors.black),
                  title: const Text('Workout Plans'),
                  onTap: () {
                    // Navigate to the workout plans page when the tile is tapped
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Workout_Plans())
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.play_circle_fill, color: Colors.black),
                  title: const Text('Music Playlist'),
                  onTap: () {
                    // Navigate to the music playlist page when the tile is tapped
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MusicPlaylist())
                    );
                  },
                ),
              ],// end of children cases
            ),
          ),
    );
  }
}
