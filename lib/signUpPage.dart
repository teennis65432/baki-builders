import 'package:baki_builders/MainHomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Drawer.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController passConfirmController = TextEditingController();
String errorText = '';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black45,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
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
                    _createAccount(context);
                  } else {
                    errorText = 'Passwords do not match';
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                  }
                },
                child: const Text('Sign Up'),
              ),
              Text(
                  errorText,
                  style: const TextStyle(
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
        title: const Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      drawer: DrawerWidget(),
    );
  }
}

Future<String?> signUp(String email, String password, BuildContext context) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = userCredential.user;
    return user!.uid;

  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      errorText = 'The password provided is too weak.';
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
    } else if (e.code == 'email-already-in-use') {
      errorText = 'The account already exists for that email.';
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
    }
  } catch (e) {
    errorText = e.toString();
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }
}

void _createAccount(BuildContext context) async {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();
  String confirmPass = passConfirmController.text.trim();

  // check that the email and password fields are not empty
  if (email.isEmpty || password.isEmpty || confirmPass.isEmpty) {
    errorText = "Please enter an email and password.";
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
    return;
  }

  // call the create user function and wait for it to complete
  String? userId = await signUp(email, password, context);
  print(userId);

  // check if an error occurred during account creation
  if (userId == null) {
    return;
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
  }

}





