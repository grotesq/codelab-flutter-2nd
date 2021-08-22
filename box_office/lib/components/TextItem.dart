import 'package:box_office/components/SimpleItem.dart';
import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  String text;
  TextItem(this.text);

  @override
  Widget build(BuildContext context) {
    return SimpleItem(
      Text( text )
    );
  }
}
