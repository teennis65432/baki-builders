import 'dart:math';

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

  dynamic images = [
    "assets/image/logov3.png"
  ];

  dynamic quotes = [
    "If someone is born a male,\nat least once in his life he’ll dream of becoming the strongest man alive.\n -Yujiro hanma"
  ];

  AssetImage randImg(){
    int min = 0;
    int max = images.length;
    Random rnd = Random();
    int r = min + rnd.nextInt(max - min);
    String imageName = images[r].toString();
    return AssetImage(imageName);
  }

  String randQuote() {
    int min = 0;
    int max = quotes.length;
    Random rnd = Random();
    int r = min + rnd.nextInt(max - min);
    String quote = quotes[r].toString();
    return quote;
  }

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
              body: Align(
                alignment: Alignment.topCenter,
                child:Container(
                  height: 1000.0,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 50),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: randQuote(),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                            ),
                          selectionColor: Color(0xFFFFFFFF),
                          )
                        ),
                        SizedBox(height: 20),

                      ]
                    ),
                  ),
                ),
              ),
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
