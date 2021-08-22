import 'dart:convert';

import 'package:box_office/data/MovieData.dart';
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

    // http 통신
    String host = 'www.kobis.or.kr';
    String pathname = '/kobisopenapi/webservice/rest/movie/searchMovieInfo.json';
    Map<String, String> qs = {
      'key': '12869c6852f1a0d532c41a3cd540e2ef',
      'movieCd': widget.movieCd,
    };
    http.get( Uri.https( host, pathname, qs ) )
        .then( (response) {
      var json = jsonDecode( response.body );
      setState(() {
        movieData = MovieData( json['movieInfoResult']['movieInfo'] );
        status = 'loaded';
      });
    } );
  }
  @override
  Widget build(BuildContext context) {
    if( status != 'loaded' ) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(movieData.movieNm),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Text( '영화명 : ${movieData.movieNm}'),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text( '상영시간 : ${movieData.showTm}분'),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text( '제작년도 : ${movieData.prdtYear}년'),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text( '개봉일 : ${movieData.openDt}'),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Text('감독 : '),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ( context ) => PeopleList( movieData.directors[0].peopleNm )
                          )
                        );
                      },
                      child: Text(movieData.directors[0].peopleNm),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
