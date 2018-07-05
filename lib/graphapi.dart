import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class GraphAPI {
  static const _endpoint = 'https://graph.facebook.com';
  static const _headers = const {'Content-Type': 'application/json'};

  String _version;
  String _accessToken;

  GraphAPI(this._version, this._accessToken);

  FutureOr<Map<String, dynamic>> post(
      String objectId, String edge, Map<String, dynamic> node) async {
    final url =
        '$_endpoint/$_version/$objectId/$edge?access_token=$_accessToken';

    final response =
        await http.post(url, headers: _headers, body: json.encode(node));

    return new Map.from(json.decode(response.body));
  }
}
