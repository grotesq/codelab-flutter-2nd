import 'package:box_office/data/PeopleData.dart';

class MovieData {
  late String movieCd;
  late String movieNm;
  late String showTm;
  late String prdtYear;
  late String openDt;
  late List<PeopleData> directors;

  MovieData(dynamic raw) {
    this.movieCd = raw['movieCd'] ?? '';
    this.movieNm = raw['movieNm'] ?? '';
    this.showTm = raw['showTm'] ?? '';
    this.prdtYear = raw['prdtYear'] ?? '';
    this.openDt = raw['openDt'] ?? '';

    this.directors = [];
    (raw['directors'] as List<dynamic>).forEach((element) {
      directors.add(PeopleData(element));
    });
  }
}
