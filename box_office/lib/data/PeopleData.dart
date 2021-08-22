class PeopleData {
  late String peopleNm;
  late String peopleCd;
  late String repRoleNm;
  late String filmoNames;

  PeopleData( dynamic raw ) {
    this.peopleNm = raw[ 'peopleNm' ];
    this.peopleCd = raw[ 'peopleCd' ] ?? '';
    this.repRoleNm = raw[ 'repRoleNm' ] ?? '';
    this.filmoNames = raw[ 'filmoNames' ] ?? '';
  }
}
