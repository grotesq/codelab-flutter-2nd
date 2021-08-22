import 'dart:convert';
import 'dart:core';

import 'package:box_office/components/Loading.dart';
import 'package:box_office/components/SimpleItem.dart';
import 'package:box_office/components/TextItem.dart';
import 'package:box_office/data/PeopleData.dart';
import 'package:box_office/net/fetch.dart';
import 'package:box_office/screens/PersonDetail.dart';
import 'package:box_office/utils/shortFilmos.dart';
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
  int currentPage = 1;
  int totalPage = 1;

  load(int page) async {
    String pathname = '/kobisopenapi/webservice/rest/people/searchPeopleList.json';
    return await fetch(pathname, {
      'peopleNm': widget.peopleNm,
      'curPage': page.toString(),
    });
  }

  @override
  void initState() {
    super.initState();

    ( () async {
      var json = await load( currentPage );
      setState(() {
        ( json['peopleListResult']['peopleList'] as List<dynamic> ).forEach((element) {
          list.add( PeopleData( element ) );
        } );
        status = 'loaded';
        totalPage = (json['peopleListResult']['totCnt'] / 10).ceil();
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
          itemBuilder: (context, index) {
            if( index == list.length ) {
              // 마지막
              if( currentPage == totalPage ) return Container();
              return InkWell(
                onTap: () async {
                  currentPage++;
                  var json = await load( currentPage );
                  setState(() {
                    ( json['peopleListResult']['peopleList'] as List<dynamic> ).forEach((element) {
                      list.add( PeopleData( element ) );
                    } );
                  });
                },
                child: SimpleItem(
                    Center(
                      child: Text('더 보기'),
                    )
                ),
              );
            }
            else {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonDetail(list[index].peopleCd)
                    )
                  );
                },
                child: TextItem('${list[index].peopleNm} (${list[index].repRoleNm})\n${shortFilmos(list[index].filmoNames)}'),
              );
            }
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: list.length + 1
      ),
    );
  }
}