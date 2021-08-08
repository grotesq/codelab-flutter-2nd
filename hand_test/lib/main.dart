import 'package:flutter/material.dart';
import 'package:hand_test/components/ui/Link.dart';
import 'package:hand_test/screens/ResultA.dart';
import 'package:hand_test/screens/ResultB.dart';
import 'package:hand_test/screens/ResultC.dart';
import 'package:hand_test/screens/ResultD.dart';

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
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: '손바닥으로 하는 심리 테스트'),
        '/result/a': (context) => ResultA(),
        '/result/b': (context) => ResultB(),
        '/result/c': (context) => ResultC(),
        '/result/d': (context) => ResultD(),
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Link( '선택지 A', '/result/a' ),
            Link( '선택지 B', '/result/b' ),
            Link( '선택지 C', '/result/c' ),
            Link( '선택지 D', '/result/d' ),
          ],
        ),
      ),
    );
  }
}


