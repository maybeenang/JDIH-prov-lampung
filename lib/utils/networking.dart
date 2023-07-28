import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:jdih/models/produkhukum_model.dart';

class Networking {
  Networking({this.params});

  final String url = dotenv.env['BASE_URL'].toString();
  final String apikey = dotenv.env['API_KEY'].toString();
  final String? params;

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.http(url, params!), headers: {
        'X-AUTHORIZATION': apikey,
      });
      if (response.statusCode == 200) {
        String data = response.body;
        // map data to list of produk hukum
        List<ProdukHukum> produkHukum = [];
        var decodedData = jsonDecode(data)['data']['data'];

        // print(decodedData[0]);
        for (var item in decodedData) {
          produkHukum.add(ProdukHukum.fromJson(item));
        }

        return produkHukum;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
