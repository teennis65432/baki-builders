import 'package:flutter/material.dart';
import 'Drawer.dart';
import 'dart:async';

  void main() =>
      runApp(MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white10,
          appBar: AppBar(
            title: const Text("Welcome to Baki Builders"),
            centerTitle: true,
            backgroundColor: Colors.orange,
          ),
          drawer: const DrawerWidget(),
        ),
      ));