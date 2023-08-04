import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jdih/models/produkhukum_model.dart';
import 'package:jdih/services/download_service.dart';

import '../styles/colors.dart';

class ProdukItem extends StatelessWidget {
  ProdukItem({super.key, required this.data});

  Future<void> _downloadFile(BuildContext context) async {
    DownloadService downloadService = DownloadService(context: context);

    await downloadService.downloadFile(
        url: data[0].url!, nama_file: data[0].nama_file!);
  }

  final List<ProdukHukum> data;
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
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data[0].judul!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: AppColors.textColor,
                    size: 14,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    data[0].tahunTerbit!,
                    style: TextStyle(fontSize: 10, color: AppColors.textColor),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.folder_open_outlined,
                    color: AppColors.textColor,
                    size: 14,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    data[0].jenisPeraturan!,
                    style: TextStyle(fontSize: 10, color: AppColors.textColor),
                  )
                ],
              ),
              const Divider(color: Colors.black38),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () =>
                          context.go('/produkhukum/detail', extra: data),
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                                color: AppColors.textColor, width: 2)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Detail Dokumen',
                        style: TextStyle(color: AppColors.textColor),
                      )),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                      onPressed: () async {
                        _downloadFile(context);
                        // print(await getExternalStorageDirectories());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => AppColors.textColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Unduh Dokumen',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
