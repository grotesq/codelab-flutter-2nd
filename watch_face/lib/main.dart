import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('HH:mm:ss');

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration( seconds: 1 ), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          formatter.format(now),
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
    );
  }
}
