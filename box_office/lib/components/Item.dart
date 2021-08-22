import 'package:box_office/data/RankData.dart';
import 'package:box_office/screens/MovieDetail.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  RankData data;
  Item( this.data );

  TextStyle rankStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  TextStyle style = TextStyle(
    fontSize: 24,
  );
  TextStyle subInfo = TextStyle(
    fontSize: 16,
  );
  @override
  Widget build(BuildContext context) {
    return (
      InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: ( context ) => MovieDetail( data.movieCd )
          //   )
          // );
          Navigator.pushNamed(
            context,
            '/movie-detail',
            arguments: MovieDetailPageArguments(data.movieCd)
          );
        },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text( data.rank.toString(), style: rankStyle, ),
            ),
            Text(
              '${( data.rankInten < 0 ? '🔽' : '🔼' )}${data.rankInten}',
              style: subInfo,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 4, 16),
              child: Text( data.movieNm, style: style, ),
            ),
            Text( data.isNew ? '🆕' : '', style: subInfo, ),
          ],
        ),
      )
    );
  }
}