import 'package:flutter/material.dart';

class ResultC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( '결과 C' ),
      ),
      body: Column(
        children: [
          Text('결과 텍스트'),
          Text('결과 텍스트'),
        ],
      ),
    );
  }
}
