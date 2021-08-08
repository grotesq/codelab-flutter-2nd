import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  Link( String label, String to ) {
    this.label = label;
    this.to = to;
  }

  String label = '';
  String to = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, to);
      },
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          label,
          style: Theme.of(context).textTheme.headline5,
        ),
      )
    );
  }
}