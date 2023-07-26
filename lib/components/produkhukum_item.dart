import 'package:flutter/material.dart';
// import 'package:jdih/utils/networking.dart';

import '../styles/colors.dart';

class ProdukItem extends StatelessWidget {
  const ProdukItem(
      {super.key, required this.judul, required this.jenisPeraturan});

  final String judul;
  final String jenisPeraturan;

  // Networking networking = Networking(params: 'produk-hukum/10439');
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
                judul,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10.0),
              const Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: AppColors.textColor,
                    size: 14,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '2023',
                    style: TextStyle(fontSize: 10, color: AppColors.textColor),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.folder_open_outlined,
                    color: AppColors.textColor,
                    size: 14,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    jenisPeraturan,
                    style: TextStyle(fontSize: 10, color: AppColors.textColor),
                  )
                ],
              ),
              const Divider(color: Colors.black38),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        // networking.getData();
                      },
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
                      onPressed: () {},
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
