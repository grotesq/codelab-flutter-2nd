import 'dart:convert';

import 'package:box_office/data/PeopleData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PeopleList extends StatefulWidget {
  String peopleNm;
  PeopleList(this.peopleNm);

  @override
  State<StatefulWidget> createState() {
    return PeopleListState();
  }
}

class PeopleListState extends State<PeopleList> {
  String status = 'pending';
  List<PeopleData> list = [];
  @override
  void initState() {
    super.initState();

    // http 통신
    String host = 'www.kobis.or.kr';
    String pathname = '/kobisopenapi/webservice/rest/people/searchPeopleList.json';
    Map<String, String> qs = {
      'key': '12869c6852f1a0d532c41a3cd540e2ef',
      'peopleNm': widget.peopleNm,
    };
    http.get( Uri.https( host, pathname, qs ) )
        .then( (response) {
      var json = jsonDecode( response.body );
      setState(() {
        // movieData = MovieData( json['movieInfoResult']['movieInfo'] );
        ( json['peopleListResult']['peopleList'] as List<dynamic> ).forEach((element) {
          list.add( PeopleData( element ) );
        } );
        status = 'loaded';
      });
    } );
  }
  @override
  Widget build(BuildContext context) {
    if( status != 'loaded' ) return Container();
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Text('${list[index].peopleNm} (${list[index].repRoleNm})\n${list[index].filmoNames}'),
          separatorBuilder: (context, index) => Divider(),
          itemCount: list.length
      ),
    );
  }
}