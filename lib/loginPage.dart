import 'package:baki_builders/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Drawer.dart';
import 'main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final emailController = TextEditingController();
final passwordController = TextEditingController();
String errorText = '';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  login(context);
                },
                child: Text('Login'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text('Don\'t have an account? Sign up'),
              ),
              Text(
                errorText,
                style: TextStyle(
                  color: Colors.red, // Set the color here
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      drawer: DrawerWidget(),
    );
  }
}

Future<void> login(BuildContext context) async {
  String email = emailController.text;
  String password = passwordController.text;

  // check that the email and password fields are not empty
  if (email.isEmpty || password.isEmpty) {
    errorText = "Please enter an email and password.";
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    return;
  }

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      errorText = 'No userfound for that email.';
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else if (e.code == 'wrong-password') {
      errorText = 'Incorrect Password';
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}


