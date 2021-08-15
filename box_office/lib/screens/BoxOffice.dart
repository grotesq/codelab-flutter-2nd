import 'package:box_office/components/Rank.dart';
import 'package:flutter/material.dart';

class BoxOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('박스 오피스'),
      ),
      body: Rank(),
    );
  }
}
