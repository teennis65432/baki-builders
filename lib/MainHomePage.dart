import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Drawer.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App() as Widget);
}

class App extends StatelessWidget{
  final Future<FirebaseApp> fbApp = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('You have an error! ${snapshot.error.toString()}');
            return const Text('Something went wrong!');
          } else if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.white10,
              appBar: AppBar(
                title: const Text("Welcome to Baki Builders"),
                centerTitle: true,
                backgroundColor: Colors.orange,
              ),
              drawer: DrawerWidget(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    )
    );
  }
}
