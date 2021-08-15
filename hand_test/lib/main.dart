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
      body: Column(
        children: [
          Text(
            '"손 이리 줘봐" 했을 때 당신은 어떻게 손을 내밀건가요?',
            style: TextStyle( fontSize: 24 ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/result/a');
                  },
                  child: Image.asset('lib/assets/hand-type-a.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/result/b');
                  },
                  child: Image.asset('lib/assets/hand-type-b.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/result/c');
                  },
                  child: Image.asset('lib/assets/hand-type-c.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/result/d');
                  },
                  child: Image.asset('lib/assets/hand-type-d.png'),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}


