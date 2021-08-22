class FilmoData {
  late String movieCd;
  late String movieNm;
  late String moviePartNm;

  FilmoData(dynamic raw) {
    this.movieCd = raw['movieCd'] ?? '';
    this.movieNm = raw['movieNm'] ?? '';
    this.moviePartNm = raw['moviePartNm'] ?? '';
  }
}