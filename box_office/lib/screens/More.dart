import 'package:flutter/material.dart';

class MoreArguments {
  String movieCd;
  MoreArguments(this.movieCd);
}

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MoreArguments args = ModalRoute.of( context )!.settings.arguments as MoreArguments;
    return Scaffold(
      body: Center(
        child: Text( args.movieCd ),
      ),
    );
  }
}
