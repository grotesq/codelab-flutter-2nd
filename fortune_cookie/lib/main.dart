import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '포츈 쿠키!'),
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
  String result = '쿠키를 눌러 오늘의 운세를 확인하세요';
  List<String> data = [
    '대흉 - 오늘은 외출을 삼가십시오',
    '흉 - 발 밑을 항상 조심하시길',
    '보통 - 무난한 하루가 될 것입니다. 가끔은 그런 날도 필요한 법이죠.',
    '보통 - 오늘도 어제와 같이,',
    '길 - 기대하고 있던 무언가가 오늘 이루어 질 것 같습니다',
    '길 - 오늘은 컨디션이 좋은 하루가 될 겁니다',
    '대길 - 로또를 사세요!',
    '대길 - 오늘 운명적인 만남이 있을 것 같아요'
  ];

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
            GestureDetector(
              onTap: () {
                setState(() {
                  data.shuffle();
                  result = data[0];
                });
              },
              child: Image.network('https://www.nicepng.com/png/detail/838-8384649_fortune-cookie-png-fortune-cookie.png'),
            ),
            // Image.network('https://cdn.imgbin.com/25/13/14/imgbin-fortune-cookie-sohu-marketing-entertainment-gesture-others-Hgx1buvU7sHH6dmWHzBEEDEFL.jpg'),
            Text(
              result,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
