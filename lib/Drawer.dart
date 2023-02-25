import 'package:flutter/material.dart';
import 'account.dart';
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
            padding: const EdgeInsets.only(top: 25),
            //adds space from top to prevent overlapping with notification bar
            color: Colors.orange,// makes drawer color orange
            child: Column(//creates column
              children: [// creates multiple children cases for the multiple button/clickable tiles
                ListTile(
                  leading: const Icon(Icons.login, color: Colors.black),
                  title:  Text(accountText),
                  onTap: () {
                    if (accountText == 'Login/SignUp') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
                    }

                  },
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
