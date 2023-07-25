import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class Networking {
  Networking({this.params});

  final url = "jama-jama.lampungprov.go.id";

  final String? params;

  Future getData() async {
    http.Response response = await http.get(Uri.https(url, params!), headers: {
      'X-AUTHORIZATION': dotenv.env['API-KEY']!,
    });
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
