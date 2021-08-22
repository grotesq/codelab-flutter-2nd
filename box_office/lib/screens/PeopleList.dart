import 'dart:convert';

import 'package:box_office/components/Loading.dart';
import 'package:box_office/data/PeopleData.dart';
import 'package:box_office/net/fetch.dart';
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

    ( () async {
      // http 통신
      String pathname = '/kobisopenapi/webservice/rest/people/searchPeopleList.json';
      var json = await fetch(pathname, {
        'peopleNm': widget.peopleNm,
      });
      setState(() {
        // movieData = MovieData( json['movieInfoResult']['movieInfo'] );
        ( json['peopleListResult']['peopleList'] as List<dynamic> ).forEach((element) {
          list.add( PeopleData( element ) );
        } );
        status = 'loaded';
      });
    } )();
  }
  @override
  Widget build(BuildContext context) {
    if( status != 'loaded' ) return Loading();
    return Scaffold(
      appBar: AppBar(
        title: Text('검색결과 : ${widget.peopleNm}'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Text('${list[index].peopleNm} (${list[index].repRoleNm})\n${list[index].filmoNames}'),
          separatorBuilder: (context, index) => Divider(),
          itemCount: list.length
      ),
    );
  }
}