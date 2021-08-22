import 'dart:convert';

import 'package:http/http.dart' as http;

fetch( String pathname, Map<String, String> qs ) async {
  String host = 'www.kobis.or.kr';
  qs[ 'key' ] = '12869c6852f1a0d532c41a3cd540e2ef';
  var response = await http.get( Uri.https( host, pathname, qs ) );
  return jsonDecode(response.body);
}
