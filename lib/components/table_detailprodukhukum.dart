import 'package:flutter/material.dart';
import 'package:jdih/styles/colors.dart';

class TableDetailProdukHukum extends StatelessWidget {
  const TableDetailProdukHukum({super.key});

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
        tableRow("Jenis Peraturan", "Peraturan Pemerintah"),
        tableRow("Judul Peraturan",
            "PERATURAN PEMERINTAH REPUBLIK INDONESIA No. 35 Tahun 2023 Tentang KETENTUAN UMUM PAJAK DAERAH DAN RETRIBUSI DAERAH"),
        tableRow("No", "32"),
        tableRow("Tahun Terbit", "2023"),
        tableRow("Tanggal Penetapan", "16 Juni 2023"),
        tableRow("Tanggal Pengundangan", "16 Juni 2023"),
        tableRow(
            "T.E.U Badan", "KEMENTERIAN SEKRETARIAT NEGARA REPUBLIK INDONESIA"),
        tableRow("Sumber", "LNRI2023(85);160halaman"),
        tableRow("Tempat Terbit", "JAKARTA"),
        tableRow("Bidang Hukum", "-"),
        tableRow("Subjek", "-"),
        tableRow("Bahasa", "Bahasa Indonesia"),
        tableRow("Lokasi", "Biro Hukum Provinsi Lampung"),
        tableRow("Status Produk Hukum", "Peraturan Pemerintah"),
      ],
    );
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
