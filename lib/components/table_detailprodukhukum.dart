import 'package:flutter/material.dart';
import 'package:jdih/models/produkhukum.dart';
import 'package:jdih/styles/colors.dart';

class TableDetailProdukHukum extends StatelessWidget {
  const TableDetailProdukHukum({super.key, required this.data});

  final ProdukHukum data;

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
        tableRow("Jenis Peraturan", nullCheck(data.kategori!.category)),
        tableRow("Judul Peraturan", nullCheck(data.judul!)),
        tableRow("No", nullCheck(data.no!)),
        tableRow("Tahun Terbit", nullCheck(data.tempatTerbit!)),
        tableRow("Tanggal Penetapan", nullCheck(data.tanggal!)),
        tableRow("Tanggal Pengundangan", nullCheck(data.tanggal!)),
        tableRow("T.E.U Badan", nullCheck(data.teuBadan!)),
        tableRow("Sumber", nullCheck(data.sumber!)),
        tableRow("Tempat Terbit", nullCheck(data.tempatTerbit!)),
        tableRow("Bidang Hukum", nullCheck(data.bidangHukum!)),
        tableRow("Subjek", nullCheck(data.subjek!)),
        tableRow("Bahasa", nullCheck(data.bahasa!)),
        tableRow("Lokasi", nullCheck(data.lokasi!)),
        tableRow("Status Produk Hukum", nullCheck(data.status!)),
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
