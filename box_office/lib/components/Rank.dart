import 'dart:convert';

import 'package:box_office/data/RankData.dart';
import 'package:box_office/net/fetch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:developer' as dev;

import 'Item.dart';

class Rank extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RankState();
  }
}

class RankState extends State<Rank> {
  List<dynamic> list = [];

  @override
  void initState() {
    super.initState();

    ( () async {
      // http 통신
      String pathname = '/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json';
      var json = await fetch(pathname, {
        'targetDt': '20210814',
      });
      setState(() {
        list = json['boxOfficeResult']['dailyBoxOfficeList'];
      });
    } )();
  }
  @override
  Widget build(BuildContext context) {
    return (
      ListView.separated(
        itemCount: list.length,
        separatorBuilder: ( BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          RankData data = RankData( list[ index ] );
          return Item( data );
        }
      )
    );
  }
}
