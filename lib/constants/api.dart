import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoint {
  static const String produkHukumBaseUrl = 'http://jama-jama.lampungprov.go.id';
  static String beritaBaseUrl = dotenv.env['BERITA_BASE_URL'].toString();
  static const String produkHukum = '/produk-hukum';
  static const String berita = '/v1/api/berita';
  static const String downloadProdukHukumBaseUrl =
      'https://jdih.lampungprov.go.id/';
}
