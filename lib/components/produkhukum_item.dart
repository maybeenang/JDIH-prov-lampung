import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ProdukItem extends StatelessWidget {
  const ProdukItem({super.key});

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
              const Text(
                'PERATURAN PEMERINTAHAN REPUBLIK INDONESIA Nomor 35 Tahun 2023 Tentang KETENTUAN UMUM PAJAK DAERAH DAN RETRIBUSI DAERAH',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.0),
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
              const Row(
                children: [
                  Icon(
                    Icons.folder_open_outlined,
                    color: AppColors.textColor,
                    size: 14,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'PERATURAN PEMERINTAHAN REPUBLIK INDONESIA',
                    style: TextStyle(fontSize: 10, color: AppColors.textColor),
                  )
                ],
              ),
              const Divider(color: Colors.black38),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {},
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
