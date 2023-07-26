import 'package:flutter/material.dart';
import 'package:jdih/styles/colors.dart';

class TableDetailProdukHukum extends StatelessWidget {
  const TableDetailProdukHukum({super.key, required this.data});

  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(1.8),
        1: FlexColumnWidth(0.1),
        2: FlexColumnWidth(2),
      },
      children: [
        tableRow("Abstrak", "Peraturan Pemerintah"),
        tableRow("Jenis Peraturan", nullCheck(data[0].jenisPeraturan)),
        tableRow("Judul Peraturan", nullCheck(data[0].judul)),
        tableRow("No", nullCheck(data[0].noPeraturan)),
        tableRow("Tahun Terbit", nullCheck(data[0].tahunTerbit)),
        tableRow("Tanggal Penetapan", nullCheck(data[0].tanggal)),
        tableRow("Tanggal Pengundangan", nullCheck(data[0].tanggal)),
        tableRow("T.E.U Badan", nullCheck(data[0].teuBadan)),
        tableRow("Sumber", nullCheck(data[0].sumber)),
        tableRow("Tempat Terbit", nullCheck(data[0].tempatTerbit)),
        tableRow("Bidang Hukum", nullCheck(data[0].bidangHukum)),
        tableRow("Subjek", nullCheck(data[0].subjek)),
        tableRow("Bahasa", nullCheck(data[0].bahasa)),
        tableRow("Lokasi", nullCheck(data[0].lokasi)),
        tableRow("Status Produk Hukum", nullCheck(data[0].status)),
      ],
    );
  }

  String nullCheck(String? word) {
    if (word == null) {
      return "-";
    } else {
      return word;
    }
  }

  TableRow tableRow(String judul, String isi) {
    return TableRow(children: [
      Text(judul, style: tableTextStyleJudul()),
      Text(":", style: tableTextStyle()),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          isi,
          style: tableTextStyle(),
        ),
      )
    ], decoration: tableBoxStyle());
  }

  BoxDecoration tableBoxStyle() {
    return const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: AppColors.textColor, width: 1.0),
      ),
    );
  }

  TextStyle tableTextStyle() => const TextStyle(
        fontSize: 14,
        color: AppColors.textColor,
        height: 1.3,
      );

  TextStyle tableTextStyleJudul() => const TextStyle(
        fontSize: 14,
        color: AppColors.textColor,
        fontWeight: FontWeight.w600,
      );
}
