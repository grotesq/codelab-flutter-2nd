class RankData {
  late int rank;
  late int rankInten;
  late String rankOldAndNew;
  late bool isNew;
  late String movieNm;

  RankData(dynamic raw) {
    this.rank = int.parse(raw['rank']);
    this.rankInten = int.parse(raw[ 'rankInten' ]);
    this.rankOldAndNew = raw[ 'rankOldAndNew' ];
    this.isNew = rankOldAndNew == 'NEW';
    this.movieNm = raw[ 'movieNm' ];
    if( this.movieNm.length > 12 ) {
      this.movieNm = this.movieNm.substring( 0, 12 ) + '..';
    }
  }
}