import 'package:baki_builders/MainHomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Drawer.dart';
import 'dart:async';

String? email = '';

class AccountPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    email  = user?.email;
    return Scaffold(
      body: Container(
        color: Colors.black45,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                email!,
                style: Theme.of(context).textTheme.headline4,
              ),
              TextButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
                },
                child: const Text('Log Out'),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Account"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      drawer: DrawerWidget(),
    );
  }
}

