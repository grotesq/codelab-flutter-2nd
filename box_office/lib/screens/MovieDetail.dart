import 'dart:convert';

import 'package:box_office/components/Loading.dart';
import 'package:box_office/components/People.dart';
import 'package:box_office/components/SimpleItem.dart';
import 'package:box_office/components/TextItem.dart';
import 'package:box_office/data/MovieData.dart';
import 'package:box_office/net/fetch.dart';
import 'package:box_office/screens/PeopleList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieDetail extends StatefulWidget {
  String movieCd;
  MovieDetail(this.movieCd);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailState();
  }
}

class MovieDetailState extends State<MovieDetail> {
  late MovieData movieData;
  String status = 'pending';

  @override
  void initState() {
    super.initState();

    ( () async {
      // http 통신
      String pathname = '/kobisopenapi/webservice/rest/movie/searchMovieInfo.json';
      var json = await fetch(pathname, {
        'movieCd': widget.movieCd,
      });
      setState(() {
        movieData = MovieData( json['movieInfoResult']['movieInfo'] );
        status = 'loaded';
      });
    } )();
  }
  @override
  Widget build(BuildContext context) {
    if( status != 'loaded' ) return Loading();

    // 축 axis
    // 메인 축 main axis
    // 크로스 축 cross axis
    return Scaffold(
      appBar: AppBar(
        title: Text(movieData.movieNm),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextItem('영화명 : ${movieData.movieNm}'),
          TextItem('상영시간 : ${movieData.showTm}분'),
          TextItem('제작년도 : ${movieData.prdtYear}년'),
          TextItem('개봉일 : ${movieData.openDt}'),
          SimpleItem(
            People('감독', movieData.directors),
          ),
          SimpleItem(
            People('출연', movieData.actors),
          ),
        ],
      ),
    );
  }
}
