import 'package:flutter/material.dart';

class SimpleItem extends StatelessWidget {
  Widget child;
  SimpleItem(this.child);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: child,
    );
  }
}
