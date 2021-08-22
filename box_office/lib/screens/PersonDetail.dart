import 'package:box_office/components/Loading.dart';
import 'package:box_office/components/People.dart';
import 'package:box_office/components/TextItem.dart';
import 'package:box_office/data/PeopleData.dart';
import 'package:box_office/net/fetch.dart';
import 'package:box_office/screens/MovieDetail.dart';
import 'package:flutter/material.dart';

class PersonDetail extends StatefulWidget {
  String peopleCd;
  PersonDetail(this.peopleCd);

  @override
  State<StatefulWidget> createState() {
    return PersonState();
  }
}

class PersonState extends State<PersonDetail> {
  late PeopleData data;
  String status = 'pending';
  
  @override
  void initState() {
    super.initState();

    (() async {
      var json = await fetch('/kobisopenapi/webservice/rest/people/searchPeopleInfo.json', {
        'peopleCd': widget.peopleCd,
      });
      setState(() {
        status = 'loaded';
        data = PeopleData(json['peopleInfoResult']['peopleInfo']);
      });
    })();
  }
  @override
  Widget build(BuildContext context) {
    if( status != 'loaded' ) return Loading();
    return Scaffold(
      appBar: AppBar(
        title: Text(data.peopleNm),
      ),
      body: ListView(
        children: [
          TextItem('이름 : ${data.peopleNm}'),
          TextItem('분류명 : ${data.repRoleNm}'),
          TextItem('[ 필모그래피 ]'),
          ...(data.filmos.map((e) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetail(e['movieCd'])
                )
              );
            },
            child: TextItem('${e['movieNm']} (${e['moviePartNm']})'),
          )).toList())
        ],
      )
    );
  }
}