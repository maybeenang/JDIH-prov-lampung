import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/components/table_detailprodukhukum.dart';
import 'package:jdih/constants/string.dart';
import 'package:jdih/models/produkhukum.dart';
import 'package:jdih/services/download_service.dart';
import 'package:jdih/styles/colors.dart';

class DetailProdukHukumPage extends ConsumerWidget {
  const DetailProdukHukumPage({super.key, required this.data});

  final ProdukHukum data;

  Future<void> _downloadFile(BuildContext context) async {
    DownloadService downloadService = DownloadService(context: context);

    await downloadService.downloadFile(
        url: data.urlLampiran!, namaFile: data.namaFile!);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBarPage("Produk Hukum", context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    start: BorderSide(
                      color: AppColors.textColor,
                      width: 6.0,
                    ),
                  ),
                ),
                padding:
                    const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
                child: Text(
                  AppString.convertJudul(data.judul!, data.tahun!, data.no!,
                      data.kategori!.category!),
                  style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.15),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                            left: 17.5, right: 25, top: 12.5, bottom: 12.5)),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.textColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await _downloadFile(context);
                  },
                  icon: const Icon(Icons.file_download, color: Colors.white),
                  label: const Text('Unduh Dokumen',
                      style: TextStyle(color: Colors.white, fontSize: 18))),
              const SizedBox(height: 20),
              const Text(
                'Deskripsi Produk Hukum',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                data.deskripsi!,
                style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.15),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Metadata Produk Hukum',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TableDetailProdukHukum(
                data: data,
              )
            ],
          ),
        ),
      ),
    );
  }
}
