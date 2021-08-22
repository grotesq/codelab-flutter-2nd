import 'package:box_office/screens/BoxOffice.dart';
import 'package:box_office/screens/More.dart';
import 'package:box_office/screens/MovieDetail.dart';
import 'package:box_office/screens/PeopleList.dart';
import 'package:flutter/material.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => BoxOffice(),
        '/movie-detail': (context) => MovieDetailPage(),
      },
      onGenerateRoute: (settings) {

      },
    );
  }
}
