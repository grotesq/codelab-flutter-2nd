import 'package:box_office/data/PeopleData.dart';
import 'package:box_office/screens/PeopleList.dart';
import 'package:flutter/material.dart';

class People extends StatelessWidget{
  String label;
  List<PeopleData> list;
  People(this.label, this.list);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text('${label} : '),
        ...list.map((item) => (
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ( context ) => PeopleList( item.peopleNm )
                  )
              );
            },
            child: Padding(
              padding: EdgeInsets.only( right: 8 ),
              child: Text(item.peopleNm),
            ),
          )
        )).toList()
      ],
    );
  }
}
