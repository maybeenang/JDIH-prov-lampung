import 'package:flutter/material.dart';
import 'package:jdih/models/artikel.dart';
import 'package:jdih/services/download_service.dart';

import '../styles/colors.dart';

class ArtikelItem extends StatelessWidget {
  const ArtikelItem({super.key, required this.artikel});

  final Artikel artikel;
  Future<void> _downloadFile(BuildContext context, String url, String namaFile) async {
    DownloadService downloadService = DownloadService(context: context);

    await downloadService.downloadFileArtikel(
      url: url,
      namaFile: namaFile,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              artikel.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.textColor, fontSize: 14, fontWeight: FontWeight.w700),
            ),
            Text(
              artikel.content!,
              maxLines: 2,
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: AppColors.textColor,
                  size: 14,
                ),
                const SizedBox(width: 5.0),
                Text(
                  artikel.tanggal!,
                  style: const TextStyle(fontSize: 10, color: AppColors.textColor),
                )
              ],
            ),
            const Divider(color: Colors.black38),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _downloadFile(context, artikel.documentUrl!, artikel.documentUrl.toString().split('/').last);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => AppColors.textColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Unduh Dokumen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
