import 'package:box_office/data/PeopleData.dart';

class MovieData {
  late String movieCd;
  late String movieNm;
  late String showTm;
  late String prdtYear;
  late String openDt;

  MovieData( dynamic raw ) {
    this.movieCd = raw[ 'movieCd' ];
    this.movieNm = raw[ 'movieNm' ];
    this.showTm = raw[ 'showTm' ];
    this.prdtYear = raw[ 'prdtYear' ];
    this.openDt = raw[ 'openDt' ];
  }
}