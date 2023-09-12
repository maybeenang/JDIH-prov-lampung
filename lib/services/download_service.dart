import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:jdih/constants/string.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadService {
  DownloadService({required this.context});

  final BuildContext context;

  Future<bool> _checkPermission() async {
    await Permission.manageExternalStorage.request();

    return await Permission.manageExternalStorage.request().isGranted;
  }

  SnackBar snackbar(String word, String label, void Function()? onPressed) {
    return SnackBar(
      content: Text(word),
      action: SnackBarAction(
        label: label,
        onPressed: onPressed!,
      ),
    );
  }

  void showSnackBar(String word, String? label, void Function()? onPressed) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(snackbar(word, label!, onPressed));
  }

  Future<void> downloadFile(
      {required String url, required String namaFile}) async {
    bool _permissionReady = await _checkPermission();
    String _localPath = '/storage/emulated/0/Download/';

    if (!_permissionReady) {
      await Permission.manageExternalStorage.request();
      _permissionReady = await _checkPermission();
      if (!_permissionReady) {
        showSnackBar("Izinkan akses penyimpanan", "Izinkan", () async {
          await _checkPermission();
        });
        return;
      }
    }

    if (!await Directory(_localPath).exists()) {
      await Directory(_localPath).create(recursive: true);
    }

    if (File(_localPath + namaFile).existsSync()) {
      showSnackBar("File sudah ada", "Buka", () {
        OpenFile.open(_localPath + namaFile);
      });
      return;
    }

    try {
      showSnackBar("Sedang mendownlad Dokumen", " ", () {});
      await FileDownloader.downloadFile(
        url: AppString.convertDownloadUrl(url),
        name: namaFile,
        onDownloadError: (errorMessage) {
          print(errorMessage);
          ScaffoldMessenger.of(context)
              .showSnackBar(snackbar("Gagal mendownload file", "Coba lagi", () {
            downloadFile(
                url: AppString.convertDownloadUrl(url), namaFile: namaFile);
          }));
          throw Exception(errorMessage);
        },
        onDownloadCompleted: (path) async {
          print("File Downloaded at $path");
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(snackbar("File berhasil didownload", "Buka", () {
            OpenFile.open(path);
          }));
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar("Gagal mendownload file", "Coba lagi", () {
        downloadFile(
            url: AppString.convertDownloadUrl(url), namaFile: namaFile);
      }));
    }
  }
}
