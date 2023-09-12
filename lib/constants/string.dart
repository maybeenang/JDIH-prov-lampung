import 'package:jdih/constants/api.dart';

class AppString {
  static String convertJudul(
      String judul, String tahun, String nomor, String kategori) {
    return "$kategori No. $nomor Tahun $tahun Tentang $judul";
  }

  static String convertDownloadUrl(String url) {
    return EndPoint.downloadProdukHukumBaseUrl + url;
  }

  static String convertDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
  }
}
