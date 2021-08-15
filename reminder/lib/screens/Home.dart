import 'package:flutter/material.dart';
import 'package:reminder/components/Item.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  List<String> list = [
    '할일 목록 1',
    '할일 목록 2',
    '할일 목록 3',
  ];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('리마인더'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: ( BuildContext context, int index ) {
                return Item( list[ index ] );
              }
            )
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '내용을 입력하세요',
                  ),
                )
              ),
              ElevatedButton(onPressed: () {
                if( controller.text == '' ) return;
                setState(() {
                  list.add( controller.text );
                  controller.clear();
                });
              }, child: Text( '전송' ) )
            ],
          )
        ],
      )
    );
  }
}
