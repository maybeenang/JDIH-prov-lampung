import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
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
      {required String url, required String nama_file}) async {
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

    if (File(_localPath + nama_file).existsSync()) {
      showSnackBar("File sudah ada", "Buka", () {
        OpenFile.open(_localPath + nama_file);
      });
      return;
    }

    try {
      showSnackBar("Sedang mendownlad Dokumen", " ", () {});
      await FileDownloader.downloadFile(
        url: url,
        name: nama_file,
        onDownloadError: (errorMessage) {
          print(errorMessage);
          ScaffoldMessenger.of(context)
              .showSnackBar(snackbar("Gagal mendownload file", "Coba lagi", () {
            downloadFile(url: url, nama_file: nama_file);
          }));
          throw Exception(errorMessage);
        },
        onDownloadCompleted: (path) async {
          print("File Downloaded at $path");
          ScaffoldMessenger.of(context)
              .showSnackBar(snackbar("File berhasil didownload", "Buka", () {
            OpenFile.open(path);
          }));
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
