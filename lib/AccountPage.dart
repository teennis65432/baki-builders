import 'package:baki_builders/MainHomePage.dart';
import 'package:baki_builders/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Drawer.dart';
import 'dart:async';

String? email = '';
String errorText = '';

class AccountPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final passwordController = TextEditingController();
  final passConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    email  = user?.email;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black45,
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Signed in as: ",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  email!,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'Change Password',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'New Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: passConfirmController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (passwordController.text == passConfirmController.text) {
                      user?.updatePassword(passwordController.text);
                      passwordController.clear();
                      passConfirmController.clear();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
                    } else {
                      errorText = "Passwords do not match";
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
                    }

                  },
                  child: const Text('Change Password'),
                ),
                Text(
                  errorText,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
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
