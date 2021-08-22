shortFilmos( String filmos ) {
  int LENGTH = 30;
  if( filmos.length > LENGTH ) {
    return filmos.substring(0, LENGTH) + '...';
  }
  return filmos;
}
